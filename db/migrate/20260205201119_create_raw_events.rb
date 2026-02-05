class CreateRawEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :raw_events do |t|
      t.references :integration, null: false, foreign_key: true
      t.references :inbound_run, null: false, foreign_key: true
      t.string :event_type
      t.string :source_external_id
      t.jsonb :payload
      t.datetime :received_at

      t.timestamps
    end
  end
end
