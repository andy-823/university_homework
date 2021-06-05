function slice(A::Vector{T},p::Vector{Int})::Vector{T} where T
    res = eltype(A)[]
    len = length(p)
    for i in 1 : len
        push!(res, A[p[i]])
    end
    return res
end