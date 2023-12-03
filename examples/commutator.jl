using BenchmarkTools
using LinearAlgebra
using StaticArrays

function commutator(A, B)
    return A * B - B * A
end

A = rand(5, 5)
B = rand(5, 5)

@benchmark commutator(A, B)

S1 = @SMatrix rand(5, 5)
S2 = @SMatrix rand(5, 5)

@benchmark commutator(S1, S2)

function commutator(x::Real, y::Real)
    @info "Nothing to be done"
    return 0
end

commutator(1, 2)
commutator(A, B)