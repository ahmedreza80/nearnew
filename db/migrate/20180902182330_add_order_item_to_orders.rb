class AddOrderItemToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :order, foreign_key: true
  end
end