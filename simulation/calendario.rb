require 'rrschedule'
require 'faker'

require 'pg'
begin
    
db=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"manager_development", :user=>"testuser", :password=>"testpw")

league_id = 0
season_id = 0

league = db.exec("SELECT * FROM teams WHERE league_id =#{league_id} LIMIT 20")

#player1 = player1.split(" ")
#puts hometeam
#puts awayteam
rescue Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end



schedule=RRSchedule::Schedule.new(
  #array of teams that will compete against each other. If you group teams into multiple flights (divisions),
  #a separate round-robin is generated in each of them but the "physical constraints" are shared
  :teams => [
    league[0]["id"] ,league[1]["id"] ,league[2]["id"] , league[3]["id"] , league[4]["id"] , league[5]["id"] , league[6]["id"] , league[7]["id"] , league[8]["id"] , league[9]["id"] , league[10]["id"] , league[11]["id"] , league[12]["id"] , league[13]["id"] , league[14]["id"] , league[15]["id"] , league[16]["id"] , league[17]["id"] , league[18]["id"] , league[19]["id"]],
  #Setup some scheduling rules
  :rules => [
    RRSchedule::Rule.new(:wday => 6, :gt => ["7:00PM","9:00PM"], :ps => ["field #1", "field #2","field #3","field #4","field #5"]),
   
  ],

  #First games are played on...
  :start_date => Date.parse("2010/10/13"),

  #array of dates to exclude
  :exclude_dates => [Date.parse("2010/11/24"),Date.parse("2010/12/15")],

  #Number of times each team must play against each other (default is 1)
  :cycles => 2,


  #Shuffle team order before each cycle. Default is true
  :shuffle => true
)

schedule.generate
#puts schedule.to_s
n = 0
begin
    
  db=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"manager_development", :user=>"testuser", :password=>"testpw")

  jornadas = db.exec("SELECT * FROM teams WHERE league_id =#{league_id} and season_id=#{season_id} LIMIT 38")



  schedule.gamedays.each do |gd|
  puts gd.date.strftime("%Y/%m/%d")
  jornada_id = jornadas[n]["id"]
  db.exec("UPDATE jornadas SET date = '#{gd.date.strftime("%Y/%m/%d")}' WHERE  (id =#{jornada_id})")
  n +=1
  gd.games.each do |g|
    puts g.team_a.to_s + " Vs " + g.team_b.to_s + " on playing surface #{g.playing_surface} at #{g.game_time.strftime("%I:%M %p")}"  

    db.exec("INSERT INTO matches (jornada_id , hometeam_id, awayteam_id) VALUES (#{jornada_id}, #{g.team_a.to_i}, #{g.team_b.to_i})")
  end
  puts "\n"
  end
    

rescue Exception => e 
    
    puts "Exception occurred"
    puts e
  


puts "#{league[0][0]} #{league[1][0]} #{league[2][0]} #{league[3][0]} #{league[4][0]} #{league[5][0]} #{league[6][0]} #{league[7][0]} #{league[8][0]} #{league[9][0]} #{league[10][0]} #{league[11][0]} #{league[12][0]} #{league[13][0]} #{league[14][0]} #{league[15][0]} #{league[16][0]} #{league[17][0]} #{league[18][0]} #{league[19][0]}"
#puts s.rounds.collect{|r| r.to_s}
ensure
    db.close if db



end