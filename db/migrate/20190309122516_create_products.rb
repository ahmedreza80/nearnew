class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.text :description
      t.string :image
      t.string :imagetwo
      t.string :imagethree
      t.string :category

      t.timestamps
    end
  end
end
