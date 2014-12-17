#!/usr/bin/ruby

require 'pg'
require	'faker'


n = 0
20.times do


league_id = 0
season_id = 0

nombre = Faker::Hacker.noun + Faker::Address.city
nombre = nombre.to_s
city = Faker::Address.country
#ano = rand(1980..1997)
#dia = rand(1..12)
#mes = rand(1..31)
#nacimiento = "#{ano}-#{dia}-#{mes}"



begin
    
db=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"manager_development", :user=>"testuser", :password=>"testpw")

db.exec("INSERT INTO teams (league_id, season_id ,name , city , balance , socios ) VALUES (#{league_id}, #{season_id},'#{nombre}' , '#{city}' , 300000 , 10000)")

rescue Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close 

n += 1
end
end