def position(h0,h1,h2,h3,h4,a0,a1,a2,a3,a4)
	positionattack = rand(0..4)
	offreb = rand(0...4)
	if positionattack == 0
		asist = [1,2,3,4].sample
		atack = 0
		if rand(0...10) > 8
		deff = rand(0...4)
		else
			deff = 0
		end

	elsif positionattack == 1
		atack = 1
		asist = [0,2,3,4].sample
		if rand(0...10) > 8
		deff = rand(0...4)
		else
			deff = 1
		end

	elsif positionattack == 2
		atack = 2
		asist = [1,0,3,4].sample
		if rand(0...10) > 8
		deff = rand(0...4)
		else
			deff = 2
		end

	elsif positionattack == 3
		atack = 3
		asist = [1,2,0,4].sample
		if rand(0...10) > 8
		deff = rand(0...4)
		else
			deff = 3
		end

	else
		atack = 4
		asist = [1,2,3,0].sample
		if rand(0...10) > 8
		deff = rand(0...4)
		else
			deff = 4
		end
	end
	return atack.to_i+0,deff.to_i+0,asist.to_i,offreb.to_i
end

def knownplay()
end

