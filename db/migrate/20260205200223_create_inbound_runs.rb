class CreateInboundRuns < ActiveRecord::Migration[8.1]
  def change
    create_table :inbound_runs do |t|
      t.references :integration, null: false, foreign_key: true
      t.string :mode, null: false, default: "polling"
      t.string :status, null: false, default: "pending"
      t.datetime :started_at
      t.datetime :finished_at
      t.jsonb :stats
      t.string :correlation_id

      t.timestamps
    end
  end
end
