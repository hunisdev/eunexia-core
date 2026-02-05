class CreateOrderLines < ActiveRecord::Migration[8.1]
  def change
    create_table :order_lines do |t|
      t.references :order, null: false, foreign_key: true
      t.string :source_external_id
      t.string :sku
      t.string :name
      t.integer :quantity
      t.string :unit_price_cents

      t.timestamps
    end
  end
end
