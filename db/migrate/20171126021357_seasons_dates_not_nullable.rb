class SeasonsDatesNotNullable < ActiveRecord::Migration[5.1]
  def change
    change_column_null :seasons, :start_date, false
    change_column_null :seasons, :end_date, false
  end
end
