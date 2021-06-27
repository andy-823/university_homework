function findallmax(A::AbstractVector)::AbstractVector{Int}
    max = A[1]
    res = [1]
    len = length(A)
    for i in 2 : len
        if (A[i] == max) push!(res, i) end
        if (A[i] > max)
            max = A[i]
            res = [i]
        end
    end
    return res
end
