using Plots

function collatz(n)
	k = 0
	even = 0
	odd = 0 
	n_values = []
	while n > 1
		n = n%2 == 0 ? (even+=1; div(n,2)) : (odd+=1; 3n+1)
		k+=1
		push!(n_values, n)
	end
	return k, n_values, even, odd
end

function search_k(ran, num_k)
	i, f = ran
	return filter(x->collatz(x)[1] >=num_k, i:f)
end

function save_collatz_results(filename, values)
    open(filename, "w") do file
        nothing
	end
end

function plots_collatz(values)
	plot(title="Conjectura de Collatz", xlabel="NUMEROS DE ITERAÇÕES", ylabel="VALORES")
	for value in values
		k, lis_values , even, odd = collatz(value)
		max = maximum(lis_values)
		global z = plot!(lis_values, 
		markershape=:circle,
		xscale=:log10,
		yscale=:log10,
		label="n= $value, k= $k, max_value=$max, even=$even, odd=$odd ",)
		plot!(legend=:bottomleft)
	end
	return z
end


plots_collatz([27,2463 ])

savefig("/home/dante/Documentos/portifólio/conjectura_collatz/graph.pdf")
