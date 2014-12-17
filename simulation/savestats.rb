require "pg"

def saveplayerstat(player_id,team_id,match_id,minutos,puntos,t2,t2a,t3,t3a,t1,t1a,rebotes,rebotesoff,assistencias,robos,tapones,perdidas,faltas,faltasrecibidas,valoracion)

match_id = match_id
team_id = team_id
minutos = minutos
puntos = puntos
t2 = t2
t2a = t2a
t3= t3
t3a = t3a
t1 = t1
t1a = t1a
rebotes = rebotes
rebotesoff = rebotesoff
assistencias = assistencias
robos = robos
tapones = tapones
perdidas = perdidas
faltas = faltas
faltasrecibidas = faltasrecibidas
valoracion = puntos + (t2 - t2a) + (t3 - t3a) + (t1 - t1a) + rebotes + rebotesoff + assistencias + robos + faltasrecibidas + tapones - perdidas - faltas
	begin
	    
	    db=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"manager_development", :user=>"testuser", :password=>"testpw")


	    db.exec("INSERT INTO gamestats (player_id,team_id,match_id,minutos,puntos,t2,t2a,t3,t3a,t1,t1a,rebotes,rebotesoff,assistencias,robos,tapones,perdidas,faltas,faltasrecibidas,valoracion) VALUES (#{player_id},#{team_id},#{match_id},#{minutos},#{puntos},#{t2},#{t2a},#{t3},#{t3a},#{t1},#{t1a},#{rebotes},#{rebotesoff},#{assistencias},#{robos},#{tapones},#{perdidas},#{faltas},#{faltasrecibidas},#{valoracion})")

	rescue Exception => e 
	    
	    puts "Exception occurred"
	    puts e
	    
	ensure
	    db.close if db

	end

end