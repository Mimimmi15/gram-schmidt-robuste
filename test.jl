using Test

#include("gram-schmidt.jl")
include("gram-schmidt-robuste.jl")

vectors = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [2.0, 3.0, 0.0]]

orthogonal, independent = gram_schmidt_robuste(vectors)
@test length(independent) == 2
@test 1 in independent && 2 in independent
@test !(3 in independent)
@test norm(orthogonal[3]) == 0
@test isapprox(dot(orthogonal[1], orthogonal[2]), 0, atol=1e-10)

