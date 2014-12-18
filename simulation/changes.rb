def oncourtplayers(player0,player1,player2,player3,player4,player5,player6,player7,player8,player9,player10,energy0,energy1,energy2,energy3,energy4,energy5,energy6,energy7,energy8,energy9,energy10)

#check if player is injured
#check foults
#check if team have titulares
#check position
#oncourt = [0,1,2,3,4,5,6,7,8,9,10]
oncourt = [player0,player1,player2,player3,player4,player5,player6,player7,player8,player9,player10]

energy = [energy0,energy1,energy2,energy3,energy4,energy5,energy6,energy7,energy8,energy9,energy10]
suplentes = []
#cantidad energia para cambio
cambio = 65
#variables helpers
position1 = 11
position2 = 11
position3 = 11
position4 = 11
position5 = 11

n = 0
oncourt.each do |positioncheck|
	if positioncheck == 1
		if position1 == 11
			if energy[n] > cambio
			position1 = n
			else
			suplentes = suplentes.push(n)
			end
		else
			suplentes = suplentes.push(n)
		end
	elsif positioncheck == 2
		if position2 == 11
			if energy[n] > cambio
			position2 = n
			else
			suplentes = suplentes.push(n)
			end
		else
			suplentes = suplentes.push(n)
		end
	elsif positioncheck == 3
		if position3 == 11
			if energy[n] > cambio
			position3 = n
			else
			suplentes = suplentes.push(n)
			end
		else
			suplentes = suplentes.push(n)
		end
	elsif positioncheck == 4
		if position4 == 11
			if energy[n] > cambio
			position4 = n
			else
			suplentes = suplentes.push(n)
			end
		else
			suplentes = suplentes.push(n)
		end
	else 
		if position5 == 11
			if energy[n] > cambio
			position5 = n
			else
			suplentes = suplentes.push(n)
			end
		else
			suplentes = suplentes.push(n)
		end
	end
	
n += 1	
end


titulares = [position1,position2,position3,position4,position5]
#comprobar
n = 0
titulares.each do |rescue11|
	if rescue11 == 11
		puts "cambiando #{n}"
		titulares[n] = suplentes[n]
		suplentes.delete_at(n)
	end
	n += 1
end



#puts titulares
#puts "------"
#puts suplentes
#puts "------"


#check manager preferences
#check overal
#check cansancio
	return [titulares[0].to_i,titulares[1].to_i,titulares[2].to_i,titulares[3].to_i,titulares[4].to_i,suplentes[0],suplentes[1],suplentes[2],suplentes[3],suplentes[4],suplentes[5]]
end

