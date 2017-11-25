class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name

      t.timestamps
    end

    add_reference :teams, :organization, foreign_key: true, null: true
    add_reference :players, :organization, foreign_key: true, null: true
  end
end
