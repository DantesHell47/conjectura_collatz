# Versão para numeros negativos da conjectura de collatz

function collatz_negativa(n)
    k = 0
    n_values = []
    while n != -5
        n = n%2 == 0 ? div(n,2) : 3n +1 
        k += 1
        push!(n_values, n)
    end
    return k, n_values
end

collatz_negativa(-27)