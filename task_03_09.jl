function reverse!(A::Vector{T}) where T
    first = 1
    second = length(A)
    while (first < second)
        A[first], A[second] = A[second], A[first]
        first += 1
        second -= 1
    end
end