using Test
include("collatz.jl")

# CONJUNTO DE TESTE PARA DomainError
@testset "Para n < 0 e não inteiro" begin
    @test_throws DomainError collatz(0)
    for i in -100:-1
        @test_throws DomainError collatz(i)    

    end
end

# CONJUTO DE TESTE
@testset "TESTES COM O NUEMERO 27" begin
    @test collatz(27)[1] == 111
    @test collatz(27)[2][end] == 1
    @test collatz(27)[2][end-1] == 2
    @test collatz(27)[2][end-2] == 4
end
