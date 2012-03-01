include ActionView::Helpers::NumberHelper

module PhoneFormat
  module Formatters
    DEFAULT_SCRUBBER = lambda { |value| value.to_s.gsub(/[^\d|x]/, "") }

    DEFAULT_FORMATTER = lambda do |value|
      if value =~ /^\d{10,13}(x\d+)?$/
        num, ext = value.split("x")
        opts = { extension: ext }
        opts.merge!(country_code: num[0..-11]) if num.length > 10
        fmt = number_to_phone(num[(-1 * [num.length, 10].min)..-1].to_i, opts).to_s
        fmt.gsub(" x "," x").gsub("+","")
      else
        value
      end
    end

  end
end