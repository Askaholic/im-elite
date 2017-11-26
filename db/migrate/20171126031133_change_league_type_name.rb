class ChangeLeagueTypeName < ActiveRecord::Migration[5.1]
  def change
    change_table :leagues do |t|
      t.rename :type, :l_type
    end
  end
end
