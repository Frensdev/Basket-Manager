def issteal(turnover,atack,speeda,steal,deff,speedd)
	if ((turnover*2) + atack + speeda + rand(300)) > (steal + deff + speedd + 40)
	turnover = 0
	steal = 0
	return false
	else
	turnover = 1
	steal = 1
	return true
	end
end

def isblock(shot,atack,jumpa,block,deff,jumpd)

	if ((shot*2) + atack + jumpa + rand(300)) > (block + deff + jumpd + 40)
	block = 0
	return false
	else
	block = 1
	return true
	end

end

def isfoult(intensidada,intensidadd)
	if (intensidada + rand(200)) > (intensidadd + 15)
	return false
	else
	return true
	end
end

def isoffreb(reb)
	if rand(10) > 2
	return false
	else
	return true
	end
end

def isturnover(intensidada,intensidadd)
	if (intensidadd + rand(200)) > (intensidada + 30)
	return false
	else
	return true
	end
end