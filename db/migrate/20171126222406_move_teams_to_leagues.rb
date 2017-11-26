class MoveTeamsToLeagues < ActiveRecord::Migration[5.1]
  def change
    change_table :teams do |t|
      t.remove :organization_id
      t.references :league, foreign_key: true
    end
  end
end
