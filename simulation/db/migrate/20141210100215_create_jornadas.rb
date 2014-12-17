class CreateJornadas < ActiveRecord::Migration
  def change
    create_table :jornadas do |t|
      t.belongs_to :liga, index: true
      t.date :fechastart
      t.date :fechafinish
      t.integer :match1_id
      t.integer :match2_id
      t.integer :match3_id
      t.integer :match4_id
      t.integer :match5_id
      t.integer :match6_id
      t.integer :match7_id
      t.integer :match8_id
      t.integer :match9_id
      t.integer :match10_id

      t.timestamps
    end
  end
end
