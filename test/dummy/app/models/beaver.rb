class Beaver < ActiveRecord::Base
  phone_format :phone
  phone_format :custom_phone, scrubber: Proc.new {|v| v.gsub("3", "9") }, formatter: Proc.new {|v| v.gsub("9", "P") }

  def stored_phone
    self[:phone]
  end

  def stored_custom_phone
    self[:custom_phone]
  end
end
