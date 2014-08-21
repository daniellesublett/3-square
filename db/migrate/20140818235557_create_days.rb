class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.datetime :date #need to return date and day of the week
      t.integer :meal_id
      t.timestamps
    end
  end
end