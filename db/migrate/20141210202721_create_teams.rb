class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :league_id
      t.integer :season_id
      t.string :name
      t.string :city
      t.decimal :balance
      t.integer :socios

      t.timestamps
    end
  end
end
