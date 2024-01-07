# A memoização é uma tecnica muito util para armazenar resultados de funções em cache. 
# Sendo assim, permitindo que chamadas futuras com os mesmos parametros sejam resolvidas
# mais rapidamente sem precisar calcular novamente.
# Aqui que a magia começa. 
# Aqui é criado um dicionario vazio para armazenar os resultados da sequencia. No caso, `n` vai ser a chave do dicionario.

memo_dict = Dict{Int, Tuple{Int, Vector{Int}, Int, Int}}()

function collatz_recursive_memo(n::Integer)
    # Esse é o caso trivial. Vai retornar uma tupla `0, [1], 0, 0`
    if n == 1
        return 0, [1], 0, 0
    end
    # Nesse trecho vai ser verificado se a chabve `n` existe no dicionario. Então retorna o resultado 
    if haskey(memo_dict, n)
        return memo_dict[n]
    end
    # Caso contrario, o trecho abaixo calcula o a sequencia de collatz para o numero `n` e guarda os resultados no dicionario criado no inicio do código.
    if n % 2 == 0
        result = collatz_recursive_memo(div(n, 2))
        memo_dict[n] = (result[1] + 1, [n, result[2]...], result[3] + 1, result[4])
        return memo_dict[n]
    else
        result = collatz_recursive_memo(3n + 1)
        memo_dict[n] = (result[1] + 1, [n, result[2]...], result[3], result[4] + 1)
        return memo_dict[n]
    end
end
