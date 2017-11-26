class MakeOrgsNotNullable < ActiveRecord::Migration[5.1]
  def change
    Player.where(organization_id: nil).update(organization_id: 1)
    change_column_null :players, :organization_id, false

    Team.where(organization_id: nil).update(organization_id: 1)
    change_column_null :teams, :organization_id, false
  end
end
