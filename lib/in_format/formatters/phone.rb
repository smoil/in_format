module InFormat

  def phone_format(attribute, opts = {})
    opts[:setter] = Formatters::Phone::DEFAULT_SETTER unless opts.keys.include? :setter
    opts[:getter] = Formatters::Phone::DEFAULT_GETTER unless opts.keys.include? :getter

    in_format(attribute, opts)
  end

  module Formatters
    module Phone

      DEFAULT_SETTER = lambda { |value| value.to_s.gsub(/[^\d|x]/, "") }

      DEFAULT_GETTER = lambda do |value|
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

      private

      # this is a slightly modified version taken from Rails ActionView::Helpers::NumberHelper
      # credit belongs to the many people who have worked on that project
      # code is released under the MIT License, matching the license used for this project
      def self.number_to_phone(number, options = {})
        return unless number

        begin
          Float(number)
        rescue ArgumentError, TypeError
          raise InvalidNumberError, number
        end if options[:raise]

        number       = number.to_s.strip
        options      = options.symbolize_keys
        area_code    = options[:area_code]
        delimiter    = options[:delimiter] || "-"
        extension    = options[:extension]
        country_code = options[:country_code]

        if area_code
          number.gsub!(/(\d{1,3})(\d{3})(\d{4}$)/,"(\\1) \\2#{delimiter}\\3")
        else
          number.gsub!(/(\d{0,3})(\d{3})(\d{4})$/,"\\1#{delimiter}\\2#{delimiter}\\3")
          number.slice!(0, 1) if number.starts_with?(delimiter) && !delimiter.blank?
        end

        str = []
        str << "+#{country_code}#{delimiter}" unless country_code.blank?
        str << number
        str << " x #{extension}" unless extension.blank?
        str.join
      end

    end
  end

end