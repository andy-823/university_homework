module Polynoms
    import Base: +, * # это импортирование требуется, поскольку мы собираемся переопределить эти базовые опреации

    struct Polynom{T}
        coeff::Vector{T}
    end

    function +(p::Polynom, q::Polynom)
        np,nq = length(p.coeff), length(q.coeff)
        r=Vector{promote_type(eltype(p),eltype(q))}(undef,max(np,nq))
        if np >= nq
            r .= (@view p.coeff[end-nq+1:end]) .+ q.coeff  
        else
            r .= (@view q.coeff[end-np+1:end]) .+ p.coeff
        end
        return Polynom(r)
    end

    function +(p::Polynom, c::Number)
        coeff=p.coeff
        coeff[end]+=c
        return Polynom(coeff)
    end

    +(c::Number, p::Polynom)=p+c

    function *(p::Polynom, q::Polynom)
        np,nq = length(p.coeff), length(q.coeff)
        coeff=zeros(promote_type(eltype(p),eltype(q)), np+nq-1)
        for i in eachindex(p.coeff), j in eachindex(q)
            coeff[i+j-1] += p.coeff[i]*q.coeff[j]
        end
        return Polynom(coeff)
    end

    function *(p::Polynom, c::Number)
        np,nq = length(p.coeff), length(q.coeff)
        coeff=zeros(promote_type(eltype(p),typeof(c)), length(p))
        for i in eachindex(p.coeff)
            coeff[i] += coeff[i]*c
        end
        return Polynom(coeff)
    end
    
    *(c::Number, p::Polynom) = p*c

    # x = Main.Polynoms.Polynom([1, 1, 1])
    # Main.Polynoms.integral(x, 1)
    # мы находим значения в точке

    function diff(x :: Polynom, x_point)
        res = 0
        len = length(x.coeff)
        for i in len : -1 : 2
            res = res * x_point + (i - 1) * x.coeff[i] 
        end
        return res
    end

    function integral(x :: Polynom, x_point) # принимаем С за 0
        res = 0
        len = length(x.coeff)
        for i in len : -1 : 1
            res = res * x_point + x.coeff[i]/i
        end
        return res
    end
end