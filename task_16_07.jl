function dijkstra(G::AbstractMatrix, s::Integer) :: Vector
    len = length(G[1, :])

    distance = Vector(Inf, len)
    used = Vector{Bool}(false, len)

    distance[s] = 0
    used[s] =  true

    list :: Vector{Vector{Pair{Int, typeof(G)}}} = []
    for i in 1 : len
        tmp :: Vector = []
        for j in 1 : len
            if (i == j) continue end
            if G[i, j] != 0 push!(tmp, Pair(I, G[i, j])) end
        end
        push!(list, tmp)
    end
    # now we have list instead of matrix what is better for us

    point = s
    while (point != -1)
        dist = distance[point]
        neighbors = list[point, :]
        for n in neighbors
            new_dist = dist + neighbors[n]
            if (distance[n] > new_dist) distance[n] = new_dist end
        end
        used[point] = true
        point = find_lowest(distance, used)
    end
    return distance
end        

function find_lowest(a :: Vector, used :: Vector{Bool}) :: Int
    len = length(a)
    index_min = -1
    min = Inf
    for i in 1 : len
        if (a[i] < min && !used[i])
            index_min = i
            min = a[i]
        end
    end
    return index_min
end