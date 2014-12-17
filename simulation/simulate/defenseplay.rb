def issteal(turnover,atack,speeda,steal,deff,speedd)
	if (turnover + atack*0.60 + speeda*0.60 + rand(30..100)) > (steal + deff*0.60 + speedd*0.60)
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

	if (shot + atack + jumpa + rand(90..130)) > (block + deff + jumpd + rand(80))
	block = 0
	return false
	else
	block = 1
	return true
	end

end

def isfoult(intensidada,intensidadd)
	if (intensidadd + rand(50)) > (intensidada + rand(30..50))
	return true
	else
	return false
	end
end

def isoffreb(reb)
	if rand(10) > 8
	return true
	else
	return false
	end
end

def isturnover(intensidada,intensidadd)
	if (intensidadd + rand(40)) > (intensidada + rand(30..50))
	return true
	else
	return false
	end
end