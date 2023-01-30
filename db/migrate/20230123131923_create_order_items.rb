class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      t.integer :orders_id, null: false
      t.integer :item_id, null: false
      t.integer :number, null: false
      t.integer :unit_price, null: false
      t.integer :making_status, null: false, default: "0"

      t.timestamps
    end
  end
end