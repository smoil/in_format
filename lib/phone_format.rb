require "phone_format/formatters"

module PhoneFormat

  def phone_format(attribute, opts = {})
    setter = opts[:setter] ? opts[:setter] : PhoneFormat::Formatters::DEFAULT_SCRUBBER
    getter = opts[:getter] ? opts[:getter] : PhoneFormat::Formatters::DEFAULT_FORMATTER

    in_format(attribute, setter: setter, getter: getter)
  end # end phone_format

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

ActiveRecord::Base.extend(PhoneFormat)