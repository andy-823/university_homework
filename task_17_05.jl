function strong(graph :: Vector{Vector{T}}) where T
    len = length(graph)
    used :: Vector{Bool} = []
    for _ in 1 : len push!(used, false) end
    point = 1
    stack = [1]
    while !isempty(stack)
        point = stack[end]
        pop!(stack)
        for item in graph[point]
            if !used[item] push!(stack, item) end
            used[item] = true
        end
    end
    ans :: Bool = true
    for item in used ans = ans && item end
    return ans
end