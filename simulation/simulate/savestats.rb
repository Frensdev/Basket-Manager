require "sqlite3"

def saveplayerstat(match_id,team_id,position,name,apellido,minutos,puntos,t2,t2a,t3,t3a,t1,t1a,rebotes,rebotesoff,assistencias,robos,tapones,perdidas,faltas,faltasrecibidas,valoracion)

match_id = match_id
team_id = team_id
position = position
name = name
apellido = apellido
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
	    
	    db = SQLite3::Database.open "../db/development.sqlite3"

	    db.execute "INSERT INTO game_stats ('match_id','team_id','position','name','apellido','minutos','puntos','t2','t2a','t3','t3a','t1','t1a','rebotes','rebotesoff','assistencias','robos','tapones','perdidas','faltas','faltasrecibidas','valoracion') VALUES (#{match_id},#{team_id},#{position},'#{name}','#{apellido}',#{minutos},#{puntos},#{t2},#{t2a},#{t3},#{t3a},#{t1},#{t1a},#{rebotes},#{rebotesoff},#{assistencias},#{robos},#{tapones},#{perdidas},#{faltas},#{faltasrecibidas},#{valoracion})"

	rescue SQLite3::Exception => e 
	    
	    puts "Exception occurred"
	    puts e
	    
	ensure
	    db.close if db

	end

end