class MakeColumnsNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :leagues, :sport, false
    change_column_null :leagues, :l_type, false
  end
end
