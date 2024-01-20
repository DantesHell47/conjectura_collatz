# Versão da conjectura de collatz usando struct 

mutable struct Collatz
    n::Int64
    k::Int64
    even::Int64
    odd::Int64
    n_values::Vector{Int64}
end

function collatz_sequence!(collatz::Collatz)
    while collatz.n != 1
        collatz.n = collatz.n % 2 == 0 ? (collatz.even+=1; div(collatz.n, 2)) : (collatz.odd+=1; 3*collatz.n + 1)
        collatz.k += 1
        push!(collatz.n_values, collatz.n)
    end
    return collatz.k, collatz.even, collatz.odd, collatz.n_values
end

collatz_intance = Collatz(27, 0, 0, 0, [27])

collatz_sequence!(collatz_intance)