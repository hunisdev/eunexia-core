class CreateInboundAttempts < ActiveRecord::Migration[8.1]
  def change
    create_table :inbound_attempts do |t|
      t.references :inbound_run, null: false, foreign_key: true
      t.string :step
      t.string :status
      t.jsonb :request_summary
      t.jsonb :response_summary
      t.integer :http_status
      t.integer :duration_ms
      t.string :error_class
      t.text :error_message

      t.timestamps
    end
  end
end
