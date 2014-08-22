class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.text :recipe_link
      t.text :image_link
      t.text :ingredients
      t.timestamps
    end
  end
end
