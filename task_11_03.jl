function plotsegments(segments::Vector{Tuple{Point2D, Point2D}}; kwargs...)
    p = plot(;kwargs...)
    for s in segments
        plot!(collect(s); kwargs...)
    end
    return p
end