class MigrationV014AddPhysicalForeignKeys < ActiveRecord::Migration[5.1]
  def up
    change_column      :order_items, :order_id,   :bigint,  null: false
    change_column      :order_items, :product_id, :bigint,  null: false
    change_column      :products,    :user_id,    :bigint,  null: false
    change_column      :products,    :shop_id,    :bigint,  null: false
    change_column      :shops,       :user_id,    :bigint,  null: false
    add_foreign_key    :order_items, :orders,     name: :fk_order_items_on_order_id
    add_foreign_key    :order_items, :products,   name: :fk_order_items_on_product_id
    add_foreign_key    :products,    :users,      name: :fk_products_on_user_id
    add_foreign_key    :products,    :shops,      name: :fk_products_on_shop_id
    add_foreign_key    :shops,       :users,      name: :fk_shops_on_user_id
  end
  def down
    remove_foreign_key :shops,                    name: :fk_shops_on_user_id
    remove_foreign_key :products,                 name: :fk_products_on_shop_id
    remove_foreign_key :products,                 name: :fk_products_on_user_id
    remove_foreign_key :order_items,              name: :fk_order_items_on_product_id
    remove_foreign_key :order_items,              name: :fk_order_items_on_order_id
    change_column      :shops,       :user_id,    :integer, null: true
    change_column      :products,    :shop_id,    :integer, null: true
    change_column      :products,    :user_id,    :integer, null: true
    change_column      :order_items, :product_id, :integer, null: true
    change_column      :order_items, :order_id,   :integer, null: true
  end
end
