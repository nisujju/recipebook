class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :contentful_id
      t.index :contentful_id

      t.timestamps
    end
  end
end
