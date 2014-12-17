#!/usr/bin/ruby

require 'sqlite3'
require	'faker'


begin
    
db = SQLite3::Database.new "../db/development.sqlite3"

league_id = 0

league = db.execute "SELECT * FROM teams WHERE liga = #{league_id} LIMIT 20"

#player1 = player1.split(" ")
#puts hometeam
#puts awayteam
rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end

league.each do |leagues|
n = 0
5.times do



team_id = leagues[0]

mental = rand(40..99)
teamwork = rand(40..99)
potencial = rand(40..99)
intensidad = rand(40..99)

nombre = Faker::Name.first_name
apellido = Faker::Name.last_name
city = Faker::Address.country

#ano = rand(1980..1997)
#dia = rand(1..12)
#mes = rand(1..31)
#nacimiento = "#{ano}-#{dia}-#{mes}"
nacimiento = rand(1980..1997)

multcalidad = (potencial*0.1)

position = rand(1..5)
if position == 5
altura = rand(1.98..2.27)
peso = rand(120..200)
elsif position == 4
altura = rand(1.98..2.12)
peso = rand(110..180)
elsif position == 3
altura = rand(1.90..2.05)
peso = rand(100..120)
elsif position == 2
altura = rand(1.85..2.05)
peso = rand(80..120)
elsif position == 1
altura = rand(1.70..2.00)
peso = rand(60..120)
end

multfuerza = (peso*0.005)
multaltura = (altura - 2)*4

shotins = rand(((multcalidad*4)+(multaltura*10))..(80+(multfuerza*20))).to_i
shotlong = rand((multcalidad*4)..(88+(multaltura*-10))).to_i
shotmed = rand((multcalidad*4)..(103+(multfuerza*-10))).to_i
shotfree = rand(multcalidad*4..99).to_i

fuerza = rand(((multcalidad*4)+(multaltura*10))..(80+(multfuerza*20))).to_i
speed = rand(((multcalidad*4)+(multaltura*-10))..(109+(multfuerza*-30))).to_i
jump = rand(((multcalidad*4)+(multaltura*-10))..(100+(multfuerza*-10))).to_i
resist = rand(multcalidad*5..99).to_i

steal = speed = rand(((multcalidad*4)+(multaltura*-10))..(106+(multfuerza*-20))).to_i
block = rand(((multcalidad*4)+(multaltura*10))..(80+(multfuerza*20))).to_i
pass = speed = rand(((multcalidad*4)+(multaltura*-10))..(106+(multfuerza*-20))).to_i
reb = rand(((multcalidad*4)+(multaltura*10))..(80+(multfuerza*20))).to_i





begin
    
    db = SQLite3::Database.open "development.sqlite3"

    db.execute "INSERT INTO players ('team_id' , 'nombre' , 'apellido' , 'city' , 'nacimiento' , 'altura' , 'peso' , 'position' , 'shotins' , 'shotmed' , 'shotlong' , 'shotfree' , 'fuerza' , 'speed' , 'jump' , 'resist' , 'steal' , 'block' , 'pass' , 'reb' , 'mental' , 'teamwork' , 'potencial' , 'intensidad') VALUES (#{team_id}, '#{nombre}' ,'#{apellido}', '#{city}', #{nacimiento}, #{altura}, #{peso}, #{position}, #{shotins}, #{shotmed}, #{shotlong}, #{shotfree}, #{fuerza}, #{speed}, #{jump}, #{resist}, #{steal}, #{block}, #{pass}, #{reb}, #{mental}, #{teamwork}, #{potencial}, #{intensidad})"

rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db

n += 1
end
end
end