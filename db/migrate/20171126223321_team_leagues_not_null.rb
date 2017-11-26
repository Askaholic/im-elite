class TeamLeaguesNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :teams, :league_id, false
  end
end
