require "in_format/formatters"

module InFormat

  def phone_format(attribute, opts = {})
    setter = opts[:setter] ? opts[:setter] : InFormat::Formatters::Phone::DEFAULT_SETTER
    getter = opts[:getter] ? opts[:getter] : InFormat::Formatters::Phone::DEFAULT_GETTER

    in_format(attribute, setter: setter, getter: getter)
  end

  def ssn_format(attribute, opts = {})
    setter = opts[:setter] ? opts[:setter] : InFormat::Formatters::Ssn::DEFAULT_SETTER
    getter = opts[:getter] ? opts[:getter] : InFormat::Formatters::Ssn::DEFAULT_GETTER

    in_format(attribute, setter: setter, getter: getter)
  end

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

ActiveRecord::Base.extend(InFormat)