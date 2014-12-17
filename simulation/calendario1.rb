require 'pg'
require	'faker'
require 'active_record'
require 'json'



ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "127.0.0.1",
    :port     => 5432,
    :database => "manager_development",
:user=>"testuser", :password=>"testpw"
)


begin
    
season_id = 0
league_id = 0


      db=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"manager_development", :user=>"testuser", :password=>"testpw")
    38.times do
      db.exec("INSERT INTO jornadas (league_id, season_id) VALUES (#{league_id},#{season_id})")
    end
#player1 = player1.split(" ")
#puts hometeam
#puts awayteam
rescue Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end



