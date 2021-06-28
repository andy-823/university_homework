function bfs_vec(graph :: Vector{Vector{T}}) where T
    len = length(graph)
    used = Vector{Bool}(false, len)
    ans :: Vector{Int} = [1]
    point = 1
    queue = [1]
    while !isempty(stack)
        popfirst!(stack)
        for item in graph[point]
            if !used[item]
                push!(ans, item)
                push!(queue, item)
            end
            used[item] = true
        end
        point = stack[end]
    end
    return ans
end