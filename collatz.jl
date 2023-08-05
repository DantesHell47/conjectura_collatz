using Plots

function collatz(n)
	k = 0
	while n > 1
		if n%2 == 0
			n = div(n,2)
		else
			n = 3n + 1
		end
		k+=1
	end
	return k
end

	
