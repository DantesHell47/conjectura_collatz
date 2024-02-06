# Versão para numeros negativos da conjectura de collatz
#

function collatz_negativa(n)
    n_values = Int[]
    while true
        n = n%2 == 0 ? n ÷ 2 : 3n + 1
        if !(n in n_values)
            push!(n_values, n)
        else
            return n_values
        end
    end
end
