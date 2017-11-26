class CreateLeagueTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :league_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
