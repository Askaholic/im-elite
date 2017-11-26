class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :sport
      t.string :type
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
