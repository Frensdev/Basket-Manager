#!/usr/bin/ruby

require 'sqlite3'
require	'faker'


n = 0
20.times do



liga_id = 0

nombre = Faker::Hacker.noun + Faker::Address.city
nombre = nombre.to_s

city = Faker::Address.country
#ano = rand(1980..1997)
#dia = rand(1..12)
#mes = rand(1..31)
#nacimiento = "#{ano}-#{dia}-#{mes}"



begin
    
    db = SQLite3::Database.open "development.sqlite3"

    db.execute "INSERT INTO teams ('liga' , 'name' , 'city' , 'balance' , 'socios' ) VALUES (#{liga_id}, '#{nombre}' , '#{city}' , 300000 , 10000)"

rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db

n += 1
end
end