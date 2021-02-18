using QPSReader, QuadraticModels, QuadraticModelsGurobi
using Test

@testset "QuadraticModelsGurobi.jl" begin
    qps1 = readqps("QAFIRO.SIF") #lower bounds
    stats1 = gurobi(QuadraticModel(qps1))
    @test isapprox(stats1.objective, -1.59078179, atol=1e-2)

    qps2 = readqps("HS21.SIF") # low/upp bounds
    stats2 = gurobi(QuadraticModel(qps2))
    @test isapprox(stats2.objective, -9.99599999e1, atol=1e-2)

    qps3 = readqps("HS52.SIF") # free bounds
    stats3 = gurobi(QuadraticModel(qps3))
    @test isapprox(stats3.objective, 5.32664756, atol=1e-2)
end

@testset "QuadraticModelsGurobi.jl" begin
    qps1 = readqps("QAFIRO.SIF") #lower bounds
    stats1 = gurobi(QuadraticModel(qps1), objscale=1., scaling=0, presolve=0, crossover=0)
    @test isapprox(stats1.objective, -1.59078179, atol=1e-2)

    qps2 = readqps("HS21.SIF") # low/upp bounds
    stats2 = gurobi(QuadraticModel(qps2), objscale=1., scaling=0, presolve=0, crossover=0)
    @test isapprox(stats2.objective, -9.99599999e1, atol=1e-2)

    qps3 = readqps("HS52.SIF") # free bounds
    stats3 = gurobi(QuadraticModel(qps3), objscale=1., scaling=0, presolve=0, crossover=0)
    @test isapprox(stats3.objective, 5.32664756, atol=1e-2)
end