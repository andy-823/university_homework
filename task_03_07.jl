function deleteat!(A::Vector{T}, index::Int) where T
    len = length(A)
    for i in index : len - 1
        A[i] = A[i + 1]
    end
    resize!(A, len - 1)
end

function insert!(A::Vector{T}, value::T, index::Int) where T
    push!(A, 0)
    i = length(A)
    while (i > index)
        A[i] = A[i - 1]
        i -= 1
    end
    A[index] = value
end