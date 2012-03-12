module InFormat

  def ssn_format(attribute, opts = {})
    opts[:setter] = Formatters::Ssn::DEFAULT_SETTER unless opts.keys.include? :setter
    opts[:getter] = Formatters::Ssn::DEFAULT_GETTER unless opts.keys.include? :getter

    in_format(attribute, opts)
  end

  module Formatters
    module Ssn

      DEFAULT_SETTER = lambda { |value| value.to_s.gsub(/[^\d]/, "") }

      DEFAULT_GETTER = lambda do |value|
        if value =~ /^\d{9}\z/
          "#{value[0..2]}-#{value[3..4]}-#{value[5..8]}"
        else
          value
        end
      end

    end
  end

end