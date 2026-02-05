class AddIndexToIntegrationsSourceSystem < ActiveRecord::Migration[8.1]
  def change
    add_index :integrations, :source_system
  end
end
