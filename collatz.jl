using Plots; gr()

function collatz(n)
	k = 0
	n_values = []
	while n > 1
		if n%2 == 0
			n = div(n,2)
		else
			n = 3n + 1
		end
		k+=1
		push!(n_values, n)
	end
	return k, n_values
end

plot_collatz = plot(collatz(27)[2], 
	markershape=:circle, 
	c=:green, 
	legend=false, 
	xlabel="Passos", 
	ylabel="Valores",
	xlim=(1, collatz(27)[1]+5))
vline!([maximum(collatz(27)[1])],ls=:dash, lw=3.,c=:red)

savefig("graph.svg")