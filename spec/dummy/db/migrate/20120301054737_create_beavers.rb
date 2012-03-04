class CreateBeavers < ActiveRecord::Migration
  def change
    create_table :beavers do |t|
      t.string :phone
      t.string :custom_phone
      t.timestamps
    end
  end
end
