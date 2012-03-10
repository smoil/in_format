module InFormat

  def in_format(attribute, opts = {})

    if opts[:setter]
      if opts[:use_accessor]
        original_setter = self.instance_method("#{attribute}=")

        define_method("#{attribute}=") do |value|
          original_setter.bind(self).call(opts[:setter].call(value))
        end
      else
        define_method("#{attribute}=") do |value|
          self[attribute.to_sym] = opts[:setter].call(value)
        end
      end
    end

    if opts[:getter]
      if opts[:use_accessor]
        original_getter = self.instance_method(attribute)

        define_method("#{attribute}") do |raw = false|
          if raw
            original_getter.bind(self).call
          else
            opts[:getter].call(original_getter.bind(self).call)
          end
        end
      else
        define_method("#{attribute}") do |raw = false|
          if raw
            self[attribute.to_sym]
          else
            opts[:getter].call(self[attribute.to_sym])
          end
        end
      end
    end
  end

end