#!/usr/bin/ruby

require './shotfunc.rb'
require './playerplay.rb'
require './defenseplay.rb'
require './savestats.rb'
require './changes.rb'

require 'pg'


def simpartido(match_id,hometeam_id,awayteam_id)

match_id = match_id
hometeam_id = hometeam_id
awayteam_id = awayteam_id
begin
    
    db=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"manager_development", :user=>"testuser", :password=>"testpw")

hometeam = db.exec("SELECT * FROM players WHERE team_id = #{hometeam_id} LIMIT 5")
awayteam = db.exec("SELECT * FROM players WHERE team_id = #{awayteam_id} LIMIT 5")

  hometeam= hometeam
  awayteam = awayteam
#player1 = player1.split(" ")
#puts hometeam
#puts awayteam
rescue Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end
# helper cansancio
hometeam_energy = [100,100,100,100,100,100,100,100,100,100,100]
awayteam_energy = [100,100,100,100,100,100,100,100,100,100,100]

hstats1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats4 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

astats1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats4 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats0 = [0,0,0,0,0,0,0,0,0,0, 0, 0, 0, 0, 0, 0, 0]
#estval = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
#hstats mins0 puntos1 robos2 perdidas3 tapones4 rebotes5 faltas6 reboffensivos7 assitencias8 faltasrecibidas9 10t2 11t2a 12t3 13t3a 14t1 15t1a 16valoracion
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
#cambios
home_oncourt = oncourtplayers(0,1,2,3,4,5,6,7,8,9,10)
away_oncourt = oncourtplayers(0,1,2,3,4,5,6,7,8,9,10)

timer = 0
	if posesionteam
	play = position(hometeam[home_oncourt[0]]["position"].to_i,hometeam[home_oncourt[1]]["position"].to_i,hometeam[home_oncourt[2]]["position"].to_i,hometeam[home_oncourt[3]]["position"].to_i,hometeam[home_oncourt[4]]["position"].to_i,awayteam[away_oncourt[0]]["position"].to_i,awayteam[away_oncourt[1]]["position"].to_i,awayteam[away_oncourt[2]]["position"].to_i,awayteam[away_oncourt[3]]["position"].to_i,awayteam[away_oncourt[4]]["position"].to_i)
	atacker = hometeam[play[0]]
	defensor = awayteam[play[1]]
	offrebounder = hometeam[play[3]]
	assister = hometeam[play[2]]
	atackerstat = teamhstats[play[0]]
	defensorstat = teamastats[play[1]]
	offrebstat = teamhstats[play[3]]
	asiststat = teamhstats[play[2]]
	offrebound = false
		timer = rand(6.0...12.0)
		if issteal(atacker["pass"].to_i,atacker["intensidad"].to_i,atacker["speed"].to_i,defensor["steal"].to_i,defensor["intensidad"].to_i,defensor["speed"].to_i)
		atackerstat[3] = atackerstat[3] + 1
		defensorstat[2] = defensorstat[2] + 1
		timer = timer + rand(8)
		puts "#{(time - timer)} #{defensor['nombre']} stole the ball to #{atacker['nombre']}"
		elsif isturnover(atacker["intensidad"].to_i,defensor["intensidad"].to_i)
			atackerstat[3] = atackerstat[3] + 1
			timer = timer + rand(12)		
		else
		timer = timer + rand(12.0)
			if isblock(atacker["teamwork"].to_i,atacker["fuerza"].to_i,atacker["jump"].to_i,defensor["block"].to_i,defensor["fuerza"].to_i,defensor["jump"].to_i)
			#isattrebound
			atackerstat[3] = atackerstat[3] + 1
			defensorstat[4] = defensorstat[4] + 1
			puts "#{(time - timer)} #{defensor['nombre']} block #{atacker['nombre']}'s shot"
			elsif isfoult(atacker["intensidad"].to_i,defensor["intensidad"].to_i)
					atackerstat[9] = atackerstat[9] + 1
					defensorstat[6] = defensorstat[6] + 1
					teamhfoul = teamhfoul + 1
				if teamhfoul < 5

				else

					
						if shot1(atacker["shotfree"].to_i)
						atackerstat[1] = atackerstat[1] + 1
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker['nombre']} made the free shot"
						else 
						atackerstat[1] = atackerstat[1] + 0
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1
						end
					
				
						if shot1(atacker["shotfree"].to_i)
						atackerstat[1] = atackerstat[1] + 1
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker['nombre']} made the free shot"
						else
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1 
							if isoffreb(10)
							offrebstat[7] = offrebstat[7] + 1
							puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{offrebounder['nombre']}  picks the rebound"
							offrebound = true
							else
							defensorstat[5] = defensorstat[5] + 1
							puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{defensor['nombre']} picks the rebound"
							end
						end
				 
				end
			else
				if shot(atacker["shotins"].to_i,atacker["shotmed"].to_i,atacker["shotlong"].to_i) == "triple"
					if shot3(atacker["shotlong"].to_i,defensor["block"].to_i)
					atackerstat[1] = atackerstat[1] + 3
					atackerstat[12] = atackerstat[12] + 1
					atackerstat[13] = atackerstat[13] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker['nombre']} made the triple"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
							puts "asisted by #{assister['nombre']}"
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[12] = atackerstat[12] + 0
					atackerstat[13] = atackerstat[13] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the triple and #{offrebounder['nombre']}  picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the triple and #{defensor['nombre']} picks the rebound"
						end
					end 
				elsif shot(atacker["shotins"].to_i,atacker["shotmed"].to_i,atacker["shotlong"].to_i) == "mid"
					if shot2(atacker["shotmed"].to_i,defensor["block"].to_i)
					atackerstat[1] = atackerstat[1] + 2
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker['nombre']} made the mid shot"
							if isassist(10)
							asiststat[8] = asiststat[8] + 1
							puts "asisted by #{assister['nombre']}"
							end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{offrebounder['nombre']}  picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{defensor['nombre']} picks the rebound"
						end
					end
					if shot2(atacker["shotins"].to_i,defensor["block"].to_i)
					atackerstat[1] = atackerstat[1] + 2
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker['nombre']} made an inside shot"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
							puts "asisted by #{assister['nombre']}"
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the inside shot and #{offrebounder['nombre']}  picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the inside shot and #{defensor['nombre']} picks the rebound"
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
	play = position(awayteam[away_oncourt[0]]["position"].to_i,awayteam[away_oncourt[1]]["position"].to_i,awayteam[away_oncourt[2]]["position"].to_i,awayteam[away_oncourt[3]]["position"].to_i,awayteam[away_oncourt[4]]["position"].to_i,hometeam[home_oncourt[0]]["position"].to_i,hometeam[home_oncourt[1]]["position"].to_i,hometeam[home_oncourt[2]]["position"].to_i,hometeam[home_oncourt[3]]["position"].to_i,hometeam[home_oncourt[4]]["position"].to_i)
	atacker = awayteam[play[0]]
	defensor = hometeam[play[1]]
	offrebounder = awayteam[play[3]]
	assister = awayteam[play[2]]
	atackerstat = teamastats[play[0]]
	defensorstat = teamhstats[play[1]]
	offrebstat = teamastats[play[3]]
	asiststat = teamastats[play[2]]
	offrebound = false
		timer = rand(6.0...12.0)
				if issteal(atacker["pass"].to_i,atacker["intensidad"].to_i,atacker["speed"].to_i,defensor["steal"].to_i,defensor["intensidad"].to_i,defensor["speed"].to_i)
		atackerstat[3] = atackerstat[3] + 1
		defensorstat[2] = defensorstat[2] + 1
		timer = timer + rand(8)
		puts "#{(time - timer)} #{defensor['nombre']} stole the ball to #{atacker['nombre']}"
		elsif isturnover(atacker["intensidad"].to_i,defensor["intensidad"].to_i)
			atackerstat[3] = atackerstat[3] + 1
			timer = timer + rand(12)		
		else
		timer = timer + rand(12.0)
			if isblock(atacker["teamwork"].to_i,atacker["fuerza"].to_i,atacker["jump"].to_i,defensor["block"].to_i,defensor["fuerza"].to_i,defensor["jump"].to_i)
			#isattrebound
			atackerstat[3] = atackerstat[3] + 1
			defensorstat[4] = defensorstat[4] + 1
			puts "#{(time - timer)} #{defensor['nombre']} block #{atacker['nombre']}'s shot"
			elsif isfoult(atacker["intensidad"].to_i,defensor["intensidad"].to_i)
					atackerstat[9] = atackerstat[9] + 1
					defensorstat[6] = defensorstat[6] + 1
					teamafoul = teamafoul + 1
				if teamafoul < 5

				else

					
						if shot1(atacker["shotfree"].to_i)
						atackerstat[1] = atackerstat[1] + 1
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker['nombre']} made the free shot"
						else 
						atackerstat[1] = atackerstat[1] + 0
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1
						end
					
				
						if shot1(atacker["shotfree"].to_i)
						atackerstat[1] = atackerstat[1] + 1
						atackerstat[14] = atackerstat[14] + 1
						atackerstat[15] = atackerstat[15] + 1
						#isattrebound
						puts "#{(time - timer)} #{atacker['nombre']} made the free shot"
						else
						atackerstat[14] = atackerstat[14] + 0
						atackerstat[15] = atackerstat[15] + 1 
							if isoffreb(10)
							offrebstat[7] = offrebstat[7] + 1
							puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{offrebounder['nombre']}  picks the rebound"
							offrebound = true
							else
							defensorstat[5] = defensorstat[5] + 1
							puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{defensor['nombre']} picks the rebound"
							end
						end
				 
				end
			else
				if shot(atacker["shotins"].to_i,atacker["shotmed"].to_i,atacker["shotlong"].to_i) == "triple"
					if shot3(atacker["shotlong"].to_i,defensor["block"].to_i)
					atackerstat[1] = atackerstat[1] + 3
					atackerstat[12] = atackerstat[12] + 1
					atackerstat[13] = atackerstat[13] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker['nombre']} made the triple"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
							puts "asisted by #{assister['nombre']}"
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[12] = atackerstat[12] + 0
					atackerstat[13] = atackerstat[13] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the triple and #{offrebounder['nombre']}  picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the triple and #{defensor['nombre']} picks the rebound"
						end
					end 
				elsif shot(atacker["shotins"].to_i,atacker["shotmed"].to_i,atacker["shotlong"].to_i) == "mid"
					if shot2(atacker["shotmed"].to_i,defensor["block"].to_i)
					atackerstat[1] = atackerstat[1] + 2
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker['nombre']} made the mid shot"
							if isassist(10)
							asiststat[8] = asiststat[8] + 1
							puts "asisted by #{assister['nombre']}"
							end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{offrebounder['nombre']}  picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the mid shot and #{defensor['nombre']} picks the rebound"
						end
					end
					if shot2(atacker["shotins"].to_i,defensor["block"].to_i)
					atackerstat[1] = atackerstat[1] + 2
					atackerstat[10] = atackerstat[10] + 1
					atackerstat[11] = atackerstat[11] + 1
					#isattrebound
					puts "#{(time - timer)} #{atacker['nombre']} made an inside shot"
						if isassist(10)
							asiststat[8] = asiststat[8] + 1
							puts "asisted by #{assister['nombre']}"
						end
					else 
					atackerstat[1] = atackerstat[1] + 0
					atackerstat[10] = atackerstat[10] + 0
					atackerstat[11] = atackerstat[11] + 1
						if isoffreb(10)
						offrebstat[7] = offrebstat[7] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the inside shot and #{offrebounder['nombre']}  picks the rebound"
						offrebound = true
						else
						defensorstat[5] = defensorstat[5] + 1
						puts "#{(time - timer)} #{atacker['nombre']} misses the inside shot and #{defensor['nombre']} picks the rebound"
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
hometeam_energy

end
end
puts gamestats.to_s
puts "home team #{teamhstats[0][1] + teamhstats[1][1]+ teamhstats[2][1]+ teamhstats[3][1] + teamhstats[4][1]} picked #{teamhstats[0][5] + teamhstats[1][5] + teamhstats[2][5] + teamhstats[3][5] + teamhstats[4][5]} rebounds   #{teamhstats[0][3] + teamhstats[1][3] + teamhstats[2][3] + teamhstats[3][3] + teamhstats[4][3]} perdidas #{teamhstats[0][2] + teamhstats[1][2] + teamhstats[2][2] + teamhstats[3][2] + teamhstats[4][2]} robos #{teamhstats[0][4] + teamhstats[1][4] + teamhstats[2][4] + teamhstats[3][4] + teamhstats[4][4]} tapones"
puts "visit team #{teamastats[0][1]+ teamastats[1][1] + teamastats[2][1] + teamastats[3][1] + teamastats[4][1]} picked #{teamastats[0][5]+teamastats[1][5]+teamastats[2][5]+teamastats[3][5]+teamastats[4][5]} rebounds #{teamastats[0][4]+teamastats[1][4]+teamastats[2][4]+teamastats[3][4]+teamastats[4][4]} tapones #{teamastats[0][2]+teamastats[1][2]+teamastats[2][2]+teamastats[3][2]+teamastats[4][2]} robos #{teamastats[0][3]+teamastats[1][3]+teamastats[2][3]+teamastats[3][3]+teamastats[4][3]} perdidas"


#hstats mins puntos robos perdidas tapones rebotes faltas reboffensivos assitencias faltasrecibidas t2 t2a t3 t3a t1 t1a
#9position 3apellido 2 nombre 1 team_id

n=0
hometeam_stats = [0,hometeam[n]["team_id"],match_id,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
5.times do
teamhstats[n]
hometeam[n]

saveplayerstat(hometeam[n]["id"],hometeam[n]["team_id"],match_id,40,teamhstats[n][1],teamhstats[n][10],teamhstats[n][11],teamhstats[n][12],teamhstats[n][13],teamhstats[n][14],teamhstats[n][15],teamhstats[n][5],teamhstats[n][7],teamhstats[n][8],teamhstats[n][2],teamhstats[n][4],teamhstats[n][3],teamhstats[n][6],teamhstats[n][9],0)
hometeam_stats = [0,hometeam[n]["team_id"],match_id,200,hometeam_stats[4] + teamhstats[n][1],hometeam_stats[5] + teamhstats[n][10],hometeam_stats[6] + teamhstats[n][11], hometeam_stats[7] + teamhstats[n][12],hometeam_stats[8] + teamhstats[n][13], hometeam_stats[9] + teamhstats[n][14], hometeam_stats[10] + teamhstats[n][15], hometeam_stats[11] + teamhstats[n][5], hometeam_stats[12] + teamhstats[n][7], hometeam_stats[13] + teamhstats[n][8], hometeam_stats[14] + teamhstats[n][2], hometeam_stats[15] + teamhstats[n][4], hometeam_stats[16] +teamhstats[n][3], hometeam_stats[17] + teamhstats[n][6], hometeam_stats[18] + teamhstats[n][9],0]
n+=1
end
saveplayerstat(hometeam_stats[0],hometeam_stats[1],hometeam_stats[2],hometeam_stats[3],hometeam_stats[4],hometeam_stats[5],hometeam_stats[6],hometeam_stats[7],hometeam_stats[8],hometeam_stats[9],hometeam_stats[10],hometeam_stats[11],hometeam_stats[12],hometeam_stats[13],hometeam_stats[14],hometeam_stats[15],hometeam_stats[16],hometeam_stats[17],hometeam_stats[18],hometeam_stats[19])

n=0

awayteam_stats = [0,awayteam[n]["team_id"],match_id,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
5.times do
teamastats[n]
awayteam[n]

saveplayerstat(awayteam[n]["id"],awayteam[n]["team_id"],match_id,40,teamastats[n][1],teamastats[n][10],teamastats[n][11],teamastats[n][12],teamastats[n][13],teamastats[n][14],teamastats[n][15],teamastats[n][5],teamastats[n][7],teamastats[n][8],teamastats[n][2],teamastats[n][4],teamastats[n][3],teamastats[n][6],teamastats[n][9],0)
awayteam_stats = [0,awayteam[n]["team_id"],match_id,200,awayteam_stats[4] + teamastats[n][1],awayteam_stats[5] + teamastats[n][10],awayteam_stats[6] + teamastats[n][11], awayteam_stats[7] + teamastats[n][12],awayteam_stats[8] + teamastats[n][13], awayteam_stats[9] + teamastats[n][14], awayteam_stats[10] + teamastats[n][15], awayteam_stats[11] + teamastats[n][5], awayteam_stats[12] + teamastats[n][7], awayteam_stats[13] + teamastats[n][8], awayteam_stats[14] + teamastats[n][2], awayteam_stats[15] + teamastats[n][4], awayteam_stats[16] +teamastats[n][3], awayteam_stats[17] + teamastats[n][6], awayteam_stats[18] + teamastats[n][9],0]
n+=1
end
saveplayerstat(awayteam_stats[0],awayteam_stats[1],awayteam_stats[2],awayteam_stats[3],awayteam_stats[4],awayteam_stats[5],awayteam_stats[6],awayteam_stats[7],awayteam_stats[8],awayteam_stats[9],awayteam_stats[10],awayteam_stats[11],awayteam_stats[12],awayteam_stats[13],awayteam_stats[14],awayteam_stats[15],awayteam_stats[16],awayteam_stats[17],awayteam_stats[18],awayteam_stats[19])
end 