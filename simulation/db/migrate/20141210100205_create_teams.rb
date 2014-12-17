class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :liga
      t.string :name
      t.string :city
      t.decimal :balance
      t.integer :socios

      t.timestamps
    end
  end
end
