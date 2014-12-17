class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :jornada, index: true
      t.date :fecha
      t.integer :hometeam_id
      t.integer :awayteam_id
      t.integer :gamestats_id

      t.timestamps
    end
  end
end
