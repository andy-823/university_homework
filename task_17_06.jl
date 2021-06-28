function dfs_spec(graph :: Vector{Vector{T}}, start) where T
    len = length(graph)
    used :: Vector{Bool} = []
    for _ in 1 : len push!(used, false) end
    point = start
    stack = [start]
    while !isempty(stack)
        point = stack[end]
        pop!(stack)
        for item in graph[point]
            if !used[item]
                push!(ans, item)
                push!(stack, item)
            end
            used[item] = true
        end
    end
    ans :: Bool = true
    for item in used ans = ans && item end
    return ans
end

function weak(graph :: Vector{Vector{T}}) where T
    len = length(graph)
    ans = true
    for i in 1 : len ans = ans || dfs_spec(graph, i)
    return ans
end