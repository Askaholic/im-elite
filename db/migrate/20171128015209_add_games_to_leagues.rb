class AddGamesToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :league, foreign_key: true
  end
end
