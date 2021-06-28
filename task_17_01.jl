function dfs_vec(graph :: Vector{Vector{T}}) where T
    len = length(graph)
    used = Vector{Bool}(false, len)
    ans :: Vector{Int} = [1]
    point = 1
    stack = [1]
    while !isempty(stack)
        pop!(stack)
        for item in graph[point]
            if !used[item]
                push!(ans, item)
                push!(stack, item)
            end
            used[item] = true
        end
        point = stack[end]
    end
    return ans
end