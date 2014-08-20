class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.datetime :date
      t.integer :meal_id
      t.timestamps
    end
  end
end