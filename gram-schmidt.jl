function gramschmidt(us)  
    vs = copy(us)
    for i = 1 : length(vs)
        v = vs[i]
        for j = 1 : i - 1
           v .-= dot(us[i], vs[j]) * vs[j]  
        end
        v .= v / norm(v)
    end
    return vs
end