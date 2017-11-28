class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.timestamp :date, null: false
      t.numeric :team_1_points, default: 0
      t.numeric :team_2_points, default: 0
      t.references :team_1, null: false
      t.references :team_2, null: false
      t.references :team_winner

      add_foreign_key :games, :leagues, column: :team_1_id, primary_key: :id
      add_foreign_key :games, :leagues, column: :team_2_id, primary_key: :id
      add_foreign_key :games, :leagues, column: :team_winner_id, primary_key: :id

      t.timestamps
    end
  end
end
