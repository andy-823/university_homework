using Base: length_continued
function unique(A::Vector{T}) where T
    sort!(A)
    len = length(A)
    b = eltype(A)[]
    push!(b, A[1])
    for i in 2 : len
        if (A[i] > A[i - 1]) push!(b, A[i]) end
    end
    return b
end

function unique!(A::Vector{T}) where T
    b = unique(A)
    len = length(b)
    for i in 1 : len
        A[i] = b[i]
    end
    resize!(A, len)
end

function allunique(A::Vector{T}) where T
    b = unique(A)
    return (lenght(b) == length(A))
end