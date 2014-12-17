class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :jornada_id
      t.integer :hometeam_id
      t.integer :awayteam_id

      t.timestamps
    end
  end
end
