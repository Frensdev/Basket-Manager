class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :season_id

      t.timestamps
    end
  end
end
