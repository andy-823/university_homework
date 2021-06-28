function find_val2(graph :: Vector{Vector{T}}) where T
    len = length(graph)
    ans :: Vector{Int} = []
    for i in 1 : len push!(ans, 0) end
    for i in 1 : len
        len2 = length(graph[i])
        for j in 1 : len2 ans[graph[i][j]] += 1 end
    end
    return ans
end