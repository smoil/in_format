module InFormat

  def in_format(attribute, opts = {})
    if opts[:setter]
      define_method("#{attribute}=") do |value|
        self[attribute.to_sym] = opts[:setter].call(value)
      end
    end

    if opts[:getter]
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