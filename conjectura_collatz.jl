# Versão da conjectura de collatz usando struct 

mutable struct Collatz
    n::Int64
    k::Int64
    even::Int64
    odd::Int64
    n_values::Vector{Int64}
end

function collatz_sequence(collatz::Collatz)
    collatz.k = 0
    collatz.even, collatz.odd = 0
    collatz.n_values = [collatz.n]
    while collatz.n != 1
        collatz.n = collatz.n % 2 == 0 ? (collatz.even+=1, div(collatz.n, 2)) : (collatz.odd+=1, 3collatz.n + 1)
        collatz.k += 1
        push!(collatz.n_values, collatz.n)
    end
    return collatz.k, collatz.n_values, (collatz.even, collatz.odd)
end