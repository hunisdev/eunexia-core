class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :integration, null: false, foreign_key: true
      t.string :source_external_id
      t.string :status
      t.string :currency_string
      t.integer :total_amount_cents
      t.string :customer_email
      t.datetime :placed_at

      t.timestamps
    end
  end
end
