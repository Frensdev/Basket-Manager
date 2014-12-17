#!/usr/bin/ruby

require './shotfunc.rb'
require './playerplay.rb'
require './defenseplay.rb'
require './savestats.rb'

require 'sqlite3'


def partido(match_id,hometeam_id,awayteam_id)

match_id = match_id
hometeam_id = hometeam_id
awayteam_id = awayteam_id
begin
    
    db = SQLite3::Database.new "../db/development.sqlite3"

hometeam = db.execute "SELECT * FROM players WHERE team_id = #{hometeam_id} LIMIT 5"
awayteam = db.execute "SELECT * FROM players WHERE team_id = #{awayteam_id} LIMIT 5"

  hometeam= hometeam
  awayteam = awayteam
#player1 = player1.split(" ")
#puts hometeam
#puts awayteam
rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end

hstats1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats4 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

astats1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats4 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
#hstats mins puntos robos perdidas tapones rebotes faltas reboffensivos assitencias faltasrecibidas t2 t2a t3 t3a t1 t1a
teamhstats = [hstats0,hstats1,hstats2,hstats3,hstats4]
teamastats = [astats0,astats1,astats2,astats3,astats4]

gamestats = [teamhstats,teamastats]


h1 = hometeam[0]
h2 = hometeam[1]
h3 = hometeam[2]
h4 = hometeam[3]
h5 = hometeam[4]

a1 = awayteam[0]
a2 = awayteam[1]
a3 = awayteam[2]
a4 = awayteam[3]
a5 = awayteam[4]


posesionteam = true
4.times do
time = 600.00
teamhfoul = 0
teamafoul = 0
while time > 0.00 
timer = 0
	
	if posesionteam
	play = position(h1[9].to_i,h2[9].to_i,h3[9].to_i,h4[9].to_i,h5[9].to_i,a1[9].to_i,a2[9].to_i,a3[9].to_i,a4[9].to_i,a5[9].to_i)
	atacker = hometeam[play[0]]
	defensor = awayteam[play[1]]
	atackerstat = teamhstats[play[0]]
	defensorstat = teamastats[play[1]]
	offrebstat = teamhstats[play[3]]
	asiststat = teamhstats[play[2]]
	offrebound = false
		timer = rand(6.0...12.0)
		if issteal(((atacker[19]+atacker[17])*0.5),atacker[24],atacker[14],defensor[17],defensor[24],defensor[14])
		atackerstat[3] = atackerstat[3] + 1
		defensorstat[2] = defensorstat[2] + 1
		timer = timer + rand(8)
		puts "#{(time - timer)} #{defensor[3]} stole the ball to #{atacker[3]}"
		elsif isturnover(atacker[24],defensor[24])
			atackerstat[3] = atackerstat[3] + 1
			timer = timer + rand(12)		
		else
		timer = timer + rand(12.0)
			if isblock((((atacker[6]*50)+atacker[14])*0.5),atacker[24],atacker[15],defensor[18],defensor[24],defensor[15])
			#isattrebound
			atackerstat[3] = atackerstat[3] + 1
			defensorstat[4] = defensorstat[4] + 1
			puts "#{(time - timer)} #{defensor[3]} block #{atacker[3]}'s shot"
			elsif isfoult(atacker[24],defensor[24])
					atackerstat[9] = atackerstat[9] + 1
					defensorstat[6] = defensorstat[6] + 1
					teamhfoul = teamhfoul + 1
				if teamhfoul < 5

				else

					
						if shot1(atacker[12])
						atackerstat[1] = atackerstat[1] + 1
						defensorstat[5] = defensorstat[5] + 0
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker[3]} made the free shot"
						else 
						atackerstat[1] = atackerstat[1] + 0
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1
						end
					
				
						if shot1(atacker[12])
						atackerstat[1] = atackerstat[1] + 1
						defensorstat[5] = defensorstat[5] + 0
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker[3]} made the free shot"
						else
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1 
							if isoffreb(10)
							offrebstat[7] = offrebstat[7] + 1
							puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{offrebstat[3]} picks the rebound"
							offrebound = true
							else
							defensorstat[5] = defensorstat[5] + 1
							puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{defensor[3]} picks the rebound"
							end
						end
				 
				end
			else
				if shot(atacker[9],atacker[10],atacker[11]) == "triple"
					if shot3(atacker[11],defensor[15])
					atackerstat[1] = atackerstat[1] + 3
					defensorstat[5] = defensorstat[5] + 0
					atackerstat[12] = atackerstat[12] + 1
					atackerstat[13] = atackerstat[13] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker[3]} made the triple"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[12] = atackerstat[12] + 0
					atackerstat[13] = atackerstat[13] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the triple and #{offrebstat[3]} picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the triple and #{defensor[3]} picks the rebound"
						end
					end 
				elsif shot(atacker[9],atacker[10],atacker[11]) == "mid"
					if shot2(atacker[10],defensor[15])
					atackerstat[1] = atackerstat[1] + 2
					defensorstat[5] = defensorstat[5] + 0
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker[3]} made the mid shot"
							if isassist(10)
							asiststat[8] = asiststat[8] + 1
							end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{offrebstat[3]} picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{defensor[3]} picks the rebound"
						end
					end
					if shot2(atacker[9],defensor[13])
					atackerstat[1] = atackerstat[1] + 2
					defensorstat[5] = defensorstat[5] + 0
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker[3]} made an inside shot"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the inside shot and #{offrebstat[3]} picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the inside shot and #{defensor[3]} picks the rebound"
						end
					end
				end
			end
		end
		if offrebound
		posesionteam = true
		else
		posesionteam = false
		end
	else
	play = position(a1[9].to_i,a2[9].to_i,a3[9].to_i,a4[9].to_i,a5[9].to_i,h1[9].to_i,h2[9].to_i,h3[9].to_i,h4[9].to_i,h5[9].to_i)
	atacker = awayteam[play[0]]
	defensor = hometeam[play[1]]
	atackerstat = teamastats[play[0]]
	defensorstat = teamhstats[play[1]]
	offrebstat = teamastats[play[3]]
	asiststat = teamastats[play[2]]
	offrebound = false
		timer = rand(6.0...12.0)
		if issteal(((atacker[19]+atacker[17])*0.5),atacker[24],atacker[14],defensor[17],defensor[24],defensor[14])
		atackerstat[3] = atackerstat[3] + 1
		defensorstat[2] = defensorstat[2] + 1
		timer = timer + rand(8)
		puts "#{(time - timer)} #{defensor[3]} stole the ball to #{atacker[3]}"
		elsif isturnover(atacker[24],defensor[24])
			atackerstat[3] = atackerstat[3] + 1
			timer = timer + rand(12)
		else
		timer = timer + rand(12.0)
			if isblock((((atacker[6]*50)+atacker[14])*0.5),atacker[24],atacker[15],defensor[18],defensor[24],defensor[15])
			#isattrebound
			atackerstat[3] = atackerstat[3] + 1
			defensorstat[4] = defensorstat[4] + 1
			puts "#{(time - timer)} #{defensor[3]} block #{atacker[3]}'s shot"
			elsif isfoult(atacker[24],defensor[24])
					atackerstat[9] = atackerstat[9] + 1
					defensorstat[6] = defensorstat[6] + 1
					teamafoul = teamafoul + 1
				if teamafoul < 5


				else

				
						if shot1(atacker[12])
						atackerstat[1] = atackerstat[1] + 1
						defensorstat[5] = defensorstat[5] + 0
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker[3]} made the free shot"
						else 
						atackerstat[1] = atackerstat[1] + 0
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1

						end
			
		
						if shot1(atacker[12])
						atackerstat[1] = atackerstat[1] + 1
						defensorstat[5] = defensorstat[5] + 0
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker[3]} made the free shot"
						else 
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1
							if isoffreb(10)
							offrebstat[7] = offrebstat[7] + 1
							puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{offrebstat[3]} picks the rebound"
							offrebound = true
							else
							defensorstat[5] = defensorstat[5] + 1
							puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{defensor[3]} picks the rebound"
							end
						end
				 
				end
			else
				if shot(atacker[9],atacker[10],atacker[11]) == "triple"
					if shot3(atacker[11],defensor[15])
					atackerstat[1] = atackerstat[1] + 3
					defensorstat[5] = defensorstat[5] + 0
					atackerstat[12] = atackerstat[12] + 1
					atackerstat[13] = atackerstat[13] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker[3]} made the triple"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[12] = atackerstat[12] + 0
					atackerstat[13] = atackerstat[13] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the triple and #{offrebstat[3]} picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the triple and #{defensor[3]} picks the rebound"
						end
					end 
				elsif shot(atacker[9],atacker[10],atacker[11]) == "mid"
					if shot2(atacker[10],defensor[15])
					atackerstat[1] = atackerstat[1] + 2
					defensorstat[5] = defensorstat[5] + 0
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker[3]} made the mid shot"
							if isassist(10)
							asiststat[8] = asiststat[8] + 1
							end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{offrebstat[3]} picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the mid shot and #{defensor[3]} picks the rebound"
						end
					end
					if shot2(atacker[9],defensor[13])
					atackerstat[1] = atackerstat[1] + 2
					defensorstat[5] = defensorstat[5] + 0
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker[3]} made an inside shot"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the inside shot and #{offrebstat[3]} picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker[3]} misses the inside shot and #{defensor[3]} picks the rebound"
						end
					end
				end
			end
		end
		if offrebound
		posesionteam = false
		else
		posesionteam = true
		end
	end
time = time - timer

end
end
puts gamestats.to_s
puts "home team #{teamhstats[0][1] + teamhstats[1][1]+ teamhstats[2][1]+ teamhstats[3][1] + teamhstats[4][1]} picked #{teamhstats[0][5] + teamhstats[1][5] + teamhstats[2][5] + teamhstats[3][5] + teamhstats[4][5]} rebounds   #{teamhstats[0][3] + teamhstats[1][3] + teamhstats[2][3] + teamhstats[3][3] + teamhstats[4][3]} perdidas #{teamhstats[0][2] + teamhstats[1][2] + teamhstats[2][2] + teamhstats[3][2] + teamhstats[4][2]} robos #{teamhstats[0][4] + teamhstats[1][4] + teamhstats[2][4] + teamhstats[3][4] + teamhstats[4][4]} tapones"
puts "visit team #{teamastats[0][1]+ teamastats[1][1] + teamastats[2][1] + teamastats[3][1] + teamastats[4][1]} picked #{teamastats[0][5]+teamastats[1][5]+teamastats[2][5]+teamastats[3][5]+teamastats[4][5]} rebounds #{teamastats[0][4]+teamastats[1][4]+teamastats[2][4]+teamastats[3][4]+teamastats[4][4]} tapones #{teamastats[0][2]+teamastats[1][2]+teamastats[2][2]+teamastats[3][2]+teamastats[4][2]} robos #{teamastats[0][3]+teamastats[1][3]+teamastats[2][3]+teamastats[3][3]+teamastats[4][3]} perdidas"


#hstats mins puntos robos perdidas tapones rebotes faltas reboffensivos assitencias faltasrecibidas t2 t2a t3 t3a t1 t1a
#9position 3apellido 2 nombre 1 team_id
n=0
5.times do
teamhstats[n]
hometeam[n]

saveplayerstat(match_id,hometeam[n][1],hometeam[n][9],hometeam[n][2],hometeam[n][3],40,teamhstats[n][1],teamhstats[n][10],teamhstats[n][11],teamhstats[n][12],teamhstats[n][13],teamhstats[n][14],teamhstats[n][15],teamhstats[n][5],teamhstats[n][7],teamhstats[n][16],teamhstats[n][2],teamhstats[n][4],teamhstats[n][3],teamhstats[n][6],teamhstats[n][9],0)

n+=1


end

n=0

5.times do
teamastats[n]
awayteam[n]

saveplayerstat(match_id,awayteam[n][1],awayteam[n][9],awayteam[n][2],awayteam[n][3],40,teamastats[n][1],teamastats[n][10],teamastats[n][11],teamastats[n][12],teamastats[n][13],teamastats[n][14],teamastats[n][15],teamastats[n][5],teamastats[n][7],teamastats[n][16],teamastats[n][2],teamastats[n][4],teamastats[n][3],teamastats[n][6],teamastats[n][9],0)

n+=1


end

end