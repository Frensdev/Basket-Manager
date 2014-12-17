class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :nombre
      t.string :apellido
      t.string :city
      t.integer :nacimiento
      t.decimal :altura
      t.decimal :peso
      t.integer :position
      t.integer :shotins
      t.integer :shotmed
      t.integer :shotlong
      t.integer :shotfree
      t.integer :fuerza
      t.integer :speed
      t.integer :jump
      t.integer :resist
      t.integer :steal
      t.integer :block
      t.integer :pass
      t.integer :reb
      t.integer :mental
      t.integer :teamwork
      t.integer :potencial
      t.integer :intensidad

      t.timestamps
    end
  end
end
