def position(attackerstat0,attackerstat1,attackerstat2,attackerstat3,attackerstat4,attackeroncourt0,attackeroncourt1,attackeroncourt2,attackeroncourt3,attackeroncourt4,defenderstat0,defenderstat1,defenderstat2,defenderstat3,defenderstat4,defenderoncourt0,defenderoncourt1,defenderoncourt2,defenderoncourt3,defenderoncourt4)
	
	atackerteam = [attackeroncourt0,attackeroncourt1,attackeroncourt2,attackeroncourt3,attackeroncourt4]
	defenderteam = [defenderoncourt0,defenderoncourt1,defenderoncourt2,defenderoncourt3,defenderoncourt4]

	positionattack = rand(0..50)
	offreb = rand(5)

	if positionattack <= 10
		asist = [attackeroncourt1,attackeroncourt2,attackeroncourt3,attackeroncourt4].sample
		atack = atackerteam[0]
		if rand(0...10) > 8
			deffender = rand(0...4)
			deff = defenderteam[deffender]
		else
			deff = defenderteam[0]
		end

	elsif positionattack <= 20
		asist = [attackeroncourt0,attackeroncourt2,attackeroncourt3,attackeroncourt4].sample
		atack = atackerteam[1]
		if rand(0...10) > 8
			deffender = rand(0...4)
			deff = defenderteam[deffender]
		else
			deff = defenderteam[1]
		end


	elsif positionattack <= 30
		asist = [attackeroncourt0,attackeroncourt2,attackeroncourt3,attackeroncourt4].sample
		atack = atackerteam[2]
		if rand(0...10) > 8
			deffender = rand(0...4)
			deff = defenderteam[deffender]
		else
			deff = defenderteam[2]
		end

	elsif positionattack <= 40
		asist = [attackeroncourt0,attackeroncourt1,attackeroncourt2,attackeroncourt4].sample
		atack = atackerteam[3]
		if rand(0...10) > 8
			deffender = rand(0...4)
			deff = defenderteam[deffender]
		else
			deff = defenderteam[3]
		end

	else
		asist = [attackeroncourt0,attackeroncourt1,attackeroncourt2,attackeroncourt3].sample
		atack = atackerteam[4]
		if rand(0...10) > 8
			deffender = rand(0...4)
			deff = defenderteam[deffender]
		else
			deff = defenderteam[4]
		end
	end
	return atack.to_i,deff.to_i,asist.to_i,offreb.to_i
end

def knownplay()
end

