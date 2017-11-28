class AddStatsToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :wins, :numeric
    add_column :teams, :ties, :numeric
    add_column :teams, :losses, :numeric
  end
end
