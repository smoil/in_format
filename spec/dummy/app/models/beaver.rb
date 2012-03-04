class Beaver < ActiveRecord::Base
  phone_format :phone, include_raw: true
  phone_format :custom_phone, setter: Proc.new {|v| v.gsub("3", "9") },
                              getter: Proc.new {|v| v.gsub("9", "P") }

end
