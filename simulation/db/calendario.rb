require 'rrschedule'
require 'faker'

require 'sqlite3'

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



schedule=RRSchedule::Schedule.new(
  #array of teams that will compete against each other. If you group teams into multiple flights (divisions),
  #a separate round-robin is generated in each of them but the "physical constraints" are shared
  :teams => [
    league[0][0] , league[1][0] , league[2][0] , league[3][0] , league[4][0] , league[5][0] , league[6][0] , league[7][0] , league[8][0] , league[9][0] , league[10][0] , league[11][0] , league[12][0] , league[13][0] , league[14][0] , league[15][0] , league[16][0] , league[17][0] , league[18][0] , league[19][0]],

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
    
    db = SQLite3::Database.open "development.sqlite3"

  schedule.gamedays.each do |gd|
  puts gd.date.strftime("%Y/%m/%d")
  id = n
  db.execute "INSERT INTO jornadas ('id','liga_id' , 'fechastart' ) VALUES (#{id},#{league_id}, '#{gd.date.strftime("%Y/%m/%d")}')"
  n +=1
  gd.games.each do |g|
    puts g.team_a.to_s + " Vs " + g.team_b.to_s + " on playing surface ##{g.playing_surface} at #{g.game_time.strftime("%I:%M %p")}"  

    db.execute "INSERT INTO matches ('jornada_id' , 'fecha' , 'hometeam_id', 'awayteam_id' ) VALUES (#{id}, '#{gd.date.strftime("%Y/%m/%d")}', #{g.team_a.to_i}, #{g.team_b.to_i})"
  end
  puts "\n"
  end
    

rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    



puts "#{league[0][0]} #{league[1][0]} #{league[2][0]} #{league[3][0]} #{league[4][0]} #{league[5][0]} #{league[6][0]} #{league[7][0]} #{league[8][0]} #{league[9][0]} #{league[10][0]} #{league[11][0]} #{league[12][0]} #{league[13][0]} #{league[14][0]} #{league[15][0]} #{league[16][0]} #{league[17][0]} #{league[18][0]} #{league[19][0]}"
#puts s.rounds.collect{|r| r.to_s}
ensure
    db.close if db



end