class CreateGamestats < ActiveRecord::Migration
  def change
    create_table :gamestats do |t|
      t.integer :player_id
      t.integer :team_id
      t.integer :match_id
      t.integer :minutos
      t.integer :puntos
      t.integer :t2
      t.integer :t2a
      t.integer :t3
      t.integer :t3a
      t.integer :t1
      t.integer :t1a
      t.integer :rebotes
      t.integer :rebotesoff
      t.integer :assistencias
      t.integer :robos
      t.integer :tapones
      t.integer :perdidas
      t.integer :faltas
      t.integer :faltasrecibidas
      t.integer :valoracion

      t.timestamps
    end
  end
end
