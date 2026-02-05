class AddIndexesToRawEvents < ActiveRecord::Migration[8.1]
  def change
    add_index :raw_events, [ :integration_id, :event_type ]
    add_index :raw_events, [ :integration_id, :source_external_id ]
  end
end
