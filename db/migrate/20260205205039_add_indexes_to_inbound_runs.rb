class AddIndexesToInboundRuns < ActiveRecord::Migration[8.1]
  def change
    add_index :inbound_runs, :correlation_id, unique: true
    add_index :inbound_runs, [ :integration_id, :started_at ]
  end
end
