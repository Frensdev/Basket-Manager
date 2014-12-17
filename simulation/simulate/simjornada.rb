#!/usr/bin/ruby

require './shotfunc.rb'
require './playerplay.rb'
require './defenseplay.rb'
require './savestats.rb'
require './engine.rb'

require 'sqlite3'

jornada = [1,1,2]

begin
db = SQLite3::Database.new "../db/development.sqlite3"

partido0 = db.execute "SELECT id,hometeam_id,awayteam_id  FROM matches WHERE jornada_id = #{jornada[0].to_i} LIMIT 20"

puts partido0

rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end

partido0.each do |partido|
	puts partido
	partido(partido[0],partido[1],partido[2])


end