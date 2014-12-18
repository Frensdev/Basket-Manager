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

hometeam = db.exec("SELECT * FROM players WHERE team_id = #{hometeam_id} LIMIT 11")
awayteam = db.exec("SELECT * FROM players WHERE team_id = #{awayteam_id} LIMIT 11")

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

hstats0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats4 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats5 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats6 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats7 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats8 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats9 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
hstats10 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]


astats0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats4 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats5 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats6 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats7 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats8 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats9 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
astats10 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]


#estval = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
#hstats mins0 puntos1 robos2 perdidas3 tapones4 rebotes5 faltas6 reboffensivos7 assitencias8 faltasrecibidas9 10t2 11t2a 12t3 13t3a 14t1 15t1a 16valoracion
teamhstats = [hstats0,hstats1,hstats2,hstats3,hstats4,hstats5,hstats6,hstats7,hstats8,hstats9,hstats10]
teamastats = [astats0,astats1,astats2,astats3,astats4,astats5,astats6,astats7,astats8,astats9,astats10]

gamestats = [teamhstats,teamastats]


posesionteam = true
4.times do
home_oncourt = oncourtplayers(hometeam[0]["position"],hometeam[1]["position"],hometeam[2]["position"],hometeam[3]["position"],hometeam[4]["position"],hometeam[5]["position"],hometeam[6]["position"],hometeam[7]["position"],hometeam[8]["position"],hometeam[9]["position"],hometeam[10]["position"],hometeam_energy[0],hometeam_energy[1],hometeam_energy[2],hometeam_energy[3],hometeam_energy[4],hometeam_energy[5],hometeam_energy[6],hometeam_energy[7],hometeam_energy[8],hometeam_energy[9],hometeam_energy[10])
away_oncourt = oncourtplayers(awayteam[0]["position"],awayteam[1]["position"],awayteam[2]["position"],awayteam[3]["position"],awayteam[4]["position"],awayteam[5]["position"],awayteam[6]["position"],awayteam[7]["position"],awayteam[8]["position"],awayteam[9]["position"],awayteam[10]["position"],awayteam_energy[0],awayteam_energy[1],awayteam_energy[2],awayteam_energy[3],awayteam_energy[4],awayteam_energy[5],awayteam_energy[6],awayteam_energy[7],awayteam_energy[8],awayteam_energy[9],awayteam_energy[10])

time = 600.00
teamhfoul = 0
teamafoul = 0
while time > 0.00
#cambios
changesalowed = rand(10)
if changesalowed > 7
home_oncourt = oncourtplayers(hometeam[0]["position"],hometeam[1]["position"],hometeam[2]["position"],hometeam[3]["position"],hometeam[4]["position"],hometeam[5]["position"],hometeam[6]["position"],hometeam[7]["position"],hometeam[8]["position"],hometeam[9]["position"],hometeam[10]["position"],hometeam_energy[0],hometeam_energy[1],hometeam_energy[2],hometeam_energy[3],hometeam_energy[4],hometeam_energy[5],hometeam_energy[6],hometeam_energy[7],hometeam_energy[8],hometeam_energy[9],hometeam_energy[10])
away_oncourt = oncourtplayers(awayteam[0]["position"],awayteam[1]["position"],awayteam[2]["position"],awayteam[3]["position"],awayteam[4]["position"],awayteam[5]["position"],awayteam[6]["position"],awayteam[7]["position"],awayteam[8]["position"],awayteam[9]["position"],awayteam[10]["position"],awayteam_energy[0],awayteam_energy[1],awayteam_energy[2],awayteam_energy[3],awayteam_energy[4],awayteam_energy[5],awayteam_energy[6],awayteam_energy[7],awayteam_energy[8],awayteam_energy[9],awayteam_energy[10])
end

timer = 0
	if posesionteam
	play = position(hometeam[home_oncourt[0]]["position"].to_i,hometeam[home_oncourt[1]]["position"].to_i,hometeam[home_oncourt[2]]["position"].to_i,hometeam[home_oncourt[3]]["position"].to_i,hometeam[home_oncourt[4]]["position"].to_i,home_oncourt[0],home_oncourt[1],home_oncourt[2],home_oncourt[3],home_oncourt[4],awayteam[away_oncourt[0]]["position"].to_i,awayteam[away_oncourt[1]]["position"].to_i,awayteam[away_oncourt[2]]["position"].to_i,awayteam[away_oncourt[3]]["position"].to_i,awayteam[away_oncourt[4]]["position"].to_i,away_oncourt[0],away_oncourt[1],away_oncourt[2],away_oncourt[3],away_oncourt[4])
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
							puts "#{(time - timer)} #{atacker['nombre']} misses the free shot and #{offrebounder['nombre']}  picks the rebound"
							offrebound = true
							else
							defensorstat[5] = defensorstat[5] + 1
							puts "#{(time - timer)} #{atacker['nombre']} misses the free shot and #{defensor['nombre']} picks the rebound"
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
				else
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
	play = position(awayteam[away_oncourt[0]]["position"].to_i,awayteam[away_oncourt[1]]["position"].to_i,awayteam[away_oncourt[2]]["position"].to_i,awayteam[away_oncourt[3]]["position"].to_i,awayteam[away_oncourt[4]]["position"].to_i,away_oncourt[0],away_oncourt[1],away_oncourt[2],away_oncourt[3],away_oncourt[4],hometeam[home_oncourt[0]]["position"].to_i,hometeam[home_oncourt[1]]["position"].to_i,hometeam[home_oncourt[2]]["position"].to_i,hometeam[home_oncourt[3]]["position"].to_i,hometeam[home_oncourt[4]]["position"].to_i,home_oncourt[0],home_oncourt[1],home_oncourt[2],home_oncourt[3],home_oncourt[4])
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
							puts "#{(time - timer)} #{atacker['nombre']} misses the free shot and #{offrebounder['nombre']}  picks the rebound"
							offrebound = true
							else
							defensorstat[5] = defensorstat[5] + 1
							puts "#{(time - timer)} #{atacker['nombre']} misses the free shot and #{defensor['nombre']} picks the rebound"
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
				else
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
	if time - timer < 0
		timer = time
		time = 0
	else
	time = time - timer
	end

#contador minutos

	n = 0
	5.times do
		teamhstats[home_oncourt[n]][0] += timer
		teamastats[away_oncourt[n]][0] += timer
		n += 1
	end
#contador energía
	energy_discount = (timer*-0.1)
	energy_addcount = (timer*0.06)
#resta energía
	n = 0
	5.times do
		hometeam_energy[home_oncourt[n]] += energy_discount
		awayteam_energy[away_oncourt[n]] += energy_discount
	n += 1
	end

#suplentes
	n = 5
	6.times do
		if hometeam_energy[home_oncourt[n]] < 100
		hometeam_energy[home_oncourt[n]] += energy_addcount
		end
		if awayteam_energy[away_oncourt[n]] < 100
		awayteam_energy[away_oncourt[n]] += energy_addcount
		end
	n += 1 
	end


#end 4.times
end
#recuperación energía por cuarto
energy_addcount = 10
	n = 0
	11.times do
		if hometeam_energy[n] < 100
		hometeam_energy[n] += energy_addcount
		end
		if awayteam_energy[n] < 100
		awayteam_energy[n] += energy_addcount
		end
	n += 1 
	end
#end while
end

puts gamestats.to_s
puts "home team #{teamhstats[0][1] + teamhstats[1][1]+ teamhstats[2][1]+ teamhstats[3][1] + teamhstats[4][1]} picked #{teamhstats[0][5] + teamhstats[1][5] + teamhstats[2][5] + teamhstats[3][5] + teamhstats[4][5]} rebounds   #{teamhstats[0][3] + teamhstats[1][3] + teamhstats[2][3] + teamhstats[3][3] + teamhstats[4][3]} perdidas #{teamhstats[0][2] + teamhstats[1][2] + teamhstats[2][2] + teamhstats[3][2] + teamhstats[4][2]} robos #{teamhstats[0][4] + teamhstats[1][4] + teamhstats[2][4] + teamhstats[3][4] + teamhstats[4][4]} tapones"
puts "visit team #{teamastats[0][1]+ teamastats[1][1] + teamastats[2][1] + teamastats[3][1] + teamastats[4][1]} picked #{teamastats[0][5]+teamastats[1][5]+teamastats[2][5]+teamastats[3][5]+teamastats[4][5]} rebounds #{teamastats[0][4]+teamastats[1][4]+teamastats[2][4]+teamastats[3][4]+teamastats[4][4]} tapones #{teamastats[0][2]+teamastats[1][2]+teamastats[2][2]+teamastats[3][2]+teamastats[4][2]} robos #{teamastats[0][3]+teamastats[1][3]+teamastats[2][3]+teamastats[3][3]+teamastats[4][3]} perdidas"


#hstats mins puntos robos perdidas tapones rebotes faltas reboffensivos assitencias faltasrecibidas t2 t2a t3 t3a t1 t1a
#9position 3apellido 2 nombre 1 team_id

#estadisticas equipos
n=0
hometeam_stats = [0,hometeam[n]["team_id"],match_id,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
#guardar estadisticas jugadores y sumando para estadisticas totales team
11.times do
	teamhstats[n]
	hometeam[n]

	saveplayerstat(hometeam[n]["id"],hometeam[n]["team_id"],match_id,teamhstats[n][0],teamhstats[n][1],teamhstats[n][10],teamhstats[n][11],teamhstats[n][12],teamhstats[n][13],teamhstats[n][14],teamhstats[n][15],teamhstats[n][5],teamhstats[n][7],teamhstats[n][8],teamhstats[n][2],teamhstats[n][4],teamhstats[n][3],teamhstats[n][6],teamhstats[n][9],0)
	hometeam_stats = [0,hometeam[n]["team_id"],match_id,hometeam_stats[3] + teamhstats[n][0],hometeam_stats[4] + teamhstats[n][1],hometeam_stats[5] + teamhstats[n][10],hometeam_stats[6] + teamhstats[n][11], hometeam_stats[7] + teamhstats[n][12],hometeam_stats[8] + teamhstats[n][13], hometeam_stats[9] + teamhstats[n][14], hometeam_stats[10] + teamhstats[n][15], hometeam_stats[11] + teamhstats[n][5], hometeam_stats[12] + teamhstats[n][7], hometeam_stats[13] + teamhstats[n][8], hometeam_stats[14] + teamhstats[n][2], hometeam_stats[15] + teamhstats[n][4], hometeam_stats[16] +teamhstats[n][3], hometeam_stats[17] + teamhstats[n][6], hometeam_stats[18] + teamhstats[n][9],0]
	n+=1
end
saveplayerstat(hometeam_stats[0],hometeam_stats[1],hometeam_stats[2],hometeam_stats[3],hometeam_stats[4],hometeam_stats[5],hometeam_stats[6],hometeam_stats[7],hometeam_stats[8],hometeam_stats[9],hometeam_stats[10],hometeam_stats[11],hometeam_stats[12],hometeam_stats[13],hometeam_stats[14],hometeam_stats[15],hometeam_stats[16],hometeam_stats[17],hometeam_stats[18],hometeam_stats[19])


n=0
awayteam_stats = [0,awayteam[n]["team_id"],match_id,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
11.times do
	teamastats[n]
	awayteam[n]

	saveplayerstat(awayteam[n]["id"],awayteam[n]["team_id"],match_id,teamastats[n][0],teamastats[n][1],teamastats[n][10],teamastats[n][11],teamastats[n][12],teamastats[n][13],teamastats[n][14],teamastats[n][15],teamastats[n][5],teamastats[n][7],teamastats[n][8],teamastats[n][2],teamastats[n][4],teamastats[n][3],teamastats[n][6],teamastats[n][9],0)
	awayteam_stats = [0,awayteam[n]["team_id"],match_id,awayteam_stats[3] + teamastats[n][0],awayteam_stats[4] + teamastats[n][1],awayteam_stats[5] + teamastats[n][10],awayteam_stats[6] + teamastats[n][11], awayteam_stats[7] + teamastats[n][12],awayteam_stats[8] + teamastats[n][13], awayteam_stats[9] + teamastats[n][14], awayteam_stats[10] + teamastats[n][15], awayteam_stats[11] + teamastats[n][5], awayteam_stats[12] + teamastats[n][7], awayteam_stats[13] + teamastats[n][8], awayteam_stats[14] + teamastats[n][2], awayteam_stats[15] + teamastats[n][4], awayteam_stats[16] +teamastats[n][3], awayteam_stats[17] + teamastats[n][6], awayteam_stats[18] + teamastats[n][9],0]
	n+=1
end
saveplayerstat(awayteam_stats[0],awayteam_stats[1],awayteam_stats[2],awayteam_stats[3],awayteam_stats[4],awayteam_stats[5],awayteam_stats[6],awayteam_stats[7],awayteam_stats[8],awayteam_stats[9],awayteam_stats[10],awayteam_stats[11],awayteam_stats[12],awayteam_stats[13],awayteam_stats[14],awayteam_stats[15],awayteam_stats[16],awayteam_stats[17],awayteam_stats[18],awayteam_stats[19])
end 