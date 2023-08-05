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

function search_k(ran, num_k)
	i, f = ran
	lis =[]
	for i in i:f
		if collatz(i)[1] >= num_k
			push!(lis, i)
		end
	end
	return lis
end

function plots_collatz(values)
	plot(title="Conjectura de Collatz", xlabel="NUMEROS DE ITERAÇÕES", ylabel="VALORES")
	for value in values
		_, lis_values = collatz(value)
		global z = plot!(lis_values, 
		markershape=:circle,
		xscale=:log10,
		yscale=:log10,
		label="n= $value")
		plot!(legend=:topleft)
	end
	return z
end
plots_collatz(search_k((1,100), 111))

