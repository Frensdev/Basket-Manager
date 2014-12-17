require "faker"
r=Random.new
puts rand(Date.civil(1980, 1, 1)..Date.civil(1997, 12, 31))
puts r.rand(Date.civil(1980, 1, 1)..Date.civil(1997, 12, 31))
puts r.rand(Date.civil(1980, 1, 1)..Date.civil(1997, 12, 31))
puts rand(0..5)
puts rand(0..5)
puts rand(0..5)
