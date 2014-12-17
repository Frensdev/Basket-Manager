class CreateJornadas < ActiveRecord::Migration
  def change
    create_table :jornadas do |t|
      t.integer :league_id
      t.integer :season_id
      t.date :date

      t.timestamps
    end
  end
end
