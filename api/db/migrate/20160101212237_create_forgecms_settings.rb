class CreateForgecmsSettings < ActiveRecord::Migration
  def change
    create_table :forgecms_settings do |t|
      t.string :name
      t.string :value
      t.timestamps null: false
    end
  end
end
