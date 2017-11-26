class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.date :start_date
      t.date :end_date
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
