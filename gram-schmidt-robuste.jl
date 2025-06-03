function gram_schmidt_robuste(us; tol=1e-10)
    vs = copy(us)
    independents = Int[]
    for i = 1:length(vs)
        v = vs[i]
        for j in independents
            v .-= dot(us[i], vs[j]) * vs[j]
        end
        if norm(v) > tol
            v .= v / norm(v)
            push!(independents, i)
        else
            v .= zeros(eltype(v), length(v))
        end
    end
    return vs, independents
end