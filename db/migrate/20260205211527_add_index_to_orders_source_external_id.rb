class AddIndexToOrdersSourceExternalId < ActiveRecord::Migration[8.1]
  def change
    add_index :orders, :source_external_id, unique: true
  end
end
