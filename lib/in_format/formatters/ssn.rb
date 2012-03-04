module InFormat
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