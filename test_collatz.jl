using Test
include("collatz.jl")

# CONJUTO DE TESTE
@testset "TESTES COM O NUEMERO 27" begin
    @test collatz(27)[1] == 111
    @test collatz(27)[2][end] == 1
end
