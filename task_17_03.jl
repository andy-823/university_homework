function find_val(graph :: Vector{Vector{T}}) where T
    len = length(graph)
    ans :: Vector{Int} = []
    for i in 1 : len
        push!(ans, length(graph[i]))
    end
    return ans
end 