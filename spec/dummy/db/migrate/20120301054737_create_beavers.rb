class CreateBeavers < ActiveRecord::Migration
  def change
    create_table :beavers do |t|
      t.string :name
      t.string :name_no_set
      t.string :name_no_get
      t.string :phone
      t.string :phone_custom_set
      t.string :phone_custom_get
      t.string :phone_no_set
      t.string :phone_no_get
      t.string :ssn
      t.string :ssn_custom_set
      t.string :ssn_custom_get
      t.string :ssn_no_set
      t.string :ssn_no_get
      t.string :encrypted_secure_ssn
      t.timestamps
    end
  end
end
