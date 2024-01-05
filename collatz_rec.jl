
function collatz_recursiva(n::Integer, k=0, n_values = [])
    # Caso Base
    if n == 1
        return k, n_values, even, odd
    
    elseif n % 2 == 0
        return collatz_recursiva(div(n,2), k+1, [n_values..., div(n,2)], even+1, odd)
    else
        return collatz_recursiva(3n+1, k+1, [n_values..., 3n+1], even, odd+1)
    end
end