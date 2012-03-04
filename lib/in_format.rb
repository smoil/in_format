require "in_format/core"
require "in_format/formatters"

module InFormat
end

# ActiveRecord::Base.extend(InFormat)
require "in_format/railtie" if defined?(Rails)