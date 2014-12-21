#!/usr/bin/ruby

require './shotfunc.rb'
require './playerplay.rb'
require './defenseplay.rb'
require './savestats.rb'
require './engine.rb'

require 'pg'

jornada = [9,1,2]

begin

db=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"manager_development", :user=>"testuser", :password=>"testpw")

partidos = db.exec("SELECT id,hometeam_id,awayteam_id FROM matches WHERE jornada_id = #{jornada[0].to_i} LIMIT 20")



rescue Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end

partidos.each do |partido|
	puts partido
	simpartido(partido["id"],partido["hometeam_id"],partido["awayteam_id"])


end