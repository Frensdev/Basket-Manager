class CreateGameStats < ActiveRecord::Migration
  def change
    create_table :game_stats do |t|
      t.belongs_to :match, index: true
      t.integer :match_id
      t.integer :team_id
      t.integer :position
      t.string :name
      t.string :apellido
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
