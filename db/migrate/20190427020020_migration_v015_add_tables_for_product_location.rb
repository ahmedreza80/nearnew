class MigrationV015AddTablesForProductLocation < ActiveRecord::Migration[5.1]
  def up
    create_table :states do |t|
      t.string :name,     null: false
    end
    create_table :cities do |t|
      t.bigint :state_id, null: false
      t.string :name,     null: false
    end
    create_table :locations do |t|
      t.bigint :city_id,  null: false
      t.string :name,     null: false
    end
    add_column      :products,  :location_id, :bigint, null: false
    add_foreign_key :cities,    :states,      name: :fk_cities_on_state_id
    add_foreign_key :locations, :cities,      name: :fk_locations_on_city_id
    add_foreign_key :products,  :locations,   name: :fk_products_on_location_id
  end
  def down
    remove_foreign_key :products,  name: :fk_products_on_location_id
    remove_foreign_key :locations, name: :fk_locations_on_city_id
    remove_foreign_key :cities,    name: :fk_cities_on_state_id
    remove_column   :products,  :location_id
    drop_table      :locations
    drop_table      :cities
    drop_table      :states
  end
end
