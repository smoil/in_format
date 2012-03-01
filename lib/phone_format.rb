require "phone_format/formatters"

module PhoneFormat

  def phone_format(attribute, opts = {})

    scrubber = opts[:scrubber] ? opts[:scrubber] : PhoneFormat::Formatters::DEFAULT_SCRUBBER

    formatter = opts[:formatter] ? opts[:formatter] : PhoneFormat::Formatters::DEFAULT_FORMATTER

    define_method("#{attribute}=") do |value|
      self[attribute.to_sym] = scrubber.call(value)
    end

    define_method("#{attribute}") do
      formatter.call(self[attribute.to_sym])
    end
  end # end phone_format

end

ActiveRecord::Base.extend(PhoneFormat)