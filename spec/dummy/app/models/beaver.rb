class Beaver < ActiveRecord::Base
  in_format :name, setter: Proc.new {|v| v.upcase }, getter: Proc.new {|n| n.camelcase }
  in_format :name_no_set, getter: Proc.new {|n| n.camelcase }
  in_format :name_no_get, setter: lambda {|v| v.upcase }

  attr_accessor :accessor_method
  in_format :accessor_method, use_accessor: true, setter:-> v { v.camelcase }, getter: -> v { v.upcase }

  phone_format :phone
  phone_format :phone_custom_set, setter: -> v { v.gsub("3", "9") }
  phone_format :phone_custom_get, getter: Proc.new {|v| v.gsub("9", "P") }

  ssn_format :ssn
  ssn_format :ssn_custom_set, setter: Proc.new {|v| v.gsub("3", "9") }
  ssn_format :ssn_custom_get, getter: Proc.new {|v| v.gsub("9", "P") }

  attr_encrypted :secure_ssn, key: "my_secure_encryption_key"
  ssn_format :secure_ssn, use_accessor: true






end
