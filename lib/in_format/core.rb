module InFormat

  def in_format(attribute, opts = {})

    if opts[:setter]
      if opts[:alias]
        alias_method "_#{attribute}=".to_sym, "#{attribute}=".to_sym

        define_method("#{attribute}=") do |value|
          self.send "_#{attribute}=", opts[:setter].call(value)
        end
      else
        define_method("#{attribute}=") do |value|
          self[attribute.to_sym] = opts[:setter].call(value)
        end
      end
    end

    if opts[:getter]
      if opts[:alias]
        alias_method "_#{attribute}".to_sym, "#{attribute}".to_sym

        define_method("#{attribute}") do |raw = false|
          if raw
            self.send "_#{attribute}"
          else
            opts[:getter].call(self.send "_#{attribute}")
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