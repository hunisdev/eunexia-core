class CreateIntegrations < ActiveRecord::Migration[8.1]
  def change
    create_table :integrations do |t|
      t.string :name
      t.string :source_system, null: false
      t.boolean :enabled, default: true
      t.jsonb :settings

      t.timestamps
    end
  end
end
