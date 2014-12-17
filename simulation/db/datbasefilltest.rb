#!/usr/bin/ruby

require 'sqlite3'
require	'faker'


n = 0
5.times do


r = Random.new
altura = r.rand(1.50...250) # => 22
Faker::Number.number(2)
id = n
team_id = 1
nombre = Faker::Name.first_name
apellido = Faker::Name.last_name
city = Faker::Address.country
nacimiento = r.rand(Date.civil(1980, 1, 1)..Date.civil(1997, 12, 31))
altura = r.rand(150...250)
peso = r.rand(60...150)
shot2 = Faker::Number.number(2)
shot3 = Faker::Number.number(2)
shot1 = Faker::Number.number(2)
fuerza = Faker::Number.number(2)
agilidad = Faker::Number.number(2)
resist = Faker::Number.number(2)
steal = Faker::Number.number(2)
block = Faker::Number.number(2)
defense = Faker::Number.number(2)
pass = Faker::Number.number(2)
keep = Faker::Number.number(2)
tactical = Faker::Number.number(2)
offreb = Faker::Number.number(2)
deffreb = Faker::Number.number(2)
jump = Faker::Number.number(2)
mental = Faker::Number.number(2)
teamcomp = Faker::Number.number(2)
potencial = Faker::Number.number(2)
salary = Faker::Number.number(2)
created_at = Faker::Number.number(2)
updated_at = Faker::Number.number(2)

begin
    
    db = SQLite3::Database.open "development.sqlite3"

    db.execute "INSERT INTO players ('id', 'team_id', 'name' ,'apellido', 'city', 'nacimiento', 'altura', 'peso', 'shot2', 'shot3', 'shot1', 'fuerza', 'agilidad', 'resist', 'steal', 'block', 'defense', 'pass', 'keep', 'tactical', 'offreb', 'deffreb', 'jump', 'mental', 'teamcomp', 'potencial', 'salary') VALUES (#{id}, #{team_id}, '#{nombre}' ,'#{apellido}', '#{city}', #{nacimiento}, #{altura}, #{peso}, #{shot2}, #{shot3}, #{shot1}, #{fuerza}, #{agilidad}, #{resist}, #{steal}, #{block}, #{defense}, #{pass}, #{keep}, #{tactical}, #{offreb}, #{deffreb}, #{jump}, #{mental}, #{teamcomp}, #{potencial}, #{salary})"

rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db

n += 1
end
end