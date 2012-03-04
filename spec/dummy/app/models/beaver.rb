class Beaver < ActiveRecord::Base
  in_format :name, setter: Proc.new {|v| v.upcase }, getter: Proc.new {|n| n.camelcase }
  in_format :name_no_set, getter: Proc.new {|n| n.camelcase }
  in_format :name_no_get, setter: Proc.new {|v| v.upcase }

  phone_format :phone
  phone_format :phone_custom_set, setter: Proc.new {|v| v.gsub("3", "9") }
  phone_format :phone_custom_get, getter: Proc.new {|v| v.gsub("9", "P") }

end
