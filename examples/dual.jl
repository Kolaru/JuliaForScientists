struct Dual
    primal::Float64
    dual::Float64
end

Dual(1.2, 2.2)

# By default a dual number should be (primal, 1.0)
function Dual(primal)
    return Dual(primal, 1.0)
end

Dual(2.2)

# Let's make it more beautiful looking
function Base.show(io::IO, dual::Dual)
    print(io, "$(dual.primal) + $(dual.dual)ε")
end

Dual(2.2)

function Base.:+(x::Dual, y::Dual)
    return Dual(x.primal + y.primal, x.dual + y.dual)
end

function Base.:*(x::Real, y::Dual)
    return Dual(x * y.primal, x * y.dual)
end

function Base.exp(x::Dual)
    primal = exp(x.primal)
    return Dual(primal, x.dual * primal)
end

function f1(x)
    y = 3x
    return exp(y) + x
end

f1(1.0)

# Expected derivative: d/dx exp(3x) + x = 3exp(3x) + 1
f1(Dual(1.0))
3exp(3) + 1