# First Ruby program
# Naive fizz-buzz

i = 1
fizz = 3
buzz = 5
fizzStr = "fizz"
buzzStr = "buzz"

while i < 101 do
	if i % fizz != 0 and i % buzz != 0
		print( i )
	end
	if i % fizz == 0
		print( fizzStr )
	end 
	if i % buzz == 0
		print( buzzStr )
	end
	print( "\n" )
	i += 1
end