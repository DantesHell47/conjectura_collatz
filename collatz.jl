using Plots

"""
collatz(n)

Calcula a sequência de Collatz para um número inteiro 'n'.

Argumentos:
- `n::Int`: O número inteiro inicial para o cálculo da sequência de Collatz.

Retorna uma tupla contendo:
- `k::Int`: O número de iterações necessárias para atingir o valor 1 na sequência de Collatz.
- `n_values::Vector{Int}`: Um vetor contendo todos os valores da sequência de Collatz, incluindo o valor inicial 'n' e 1.
- `even::Int`: O número de vezes que um valor par foi encontrado durante as iterações.
- `odd::Int`: O número de vezes que um valor ímpar foi encontrado durante as iterações.
"""

function collatz(n::Real)
	if n ≤ 0 || !isinteger(n)
		throw(DomainError("Apenas números inteiros positivos são permitidos para a Conjectura de Collatz"))
	end
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

