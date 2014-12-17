def shot (shotins,shotmid,shotlong)
	if shotlong+rand(40) > 100
		return "triple"
	elsif shotmid +rand(40) > shotins + rand(20..40)
		return "mid"
	else
		return "inside"
	end
end

def shot1(shot1)
if shot1+rand(100) > 160
	return true
else 
	return false
end
   
end


def shot2(shot2,deff)

if shot2+rand(100) > deff+65
	return true
else 
	return false
end

end


def shot3(shot3,deff)
if shot3+rand(100) > deff+80
	points = 3
	return true
else 
	points = 0
	return false
end

end

def isassist(asist)
if rand(10) > 5

	return true
else 

	return false
end

end