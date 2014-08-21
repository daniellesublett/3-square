class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :meal_id
      t.text :link
      t.timestamps
    end
  end
end
