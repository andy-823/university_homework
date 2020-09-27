function great_painter(r::Robot)
    num=1
    side=Nord
    act=[]
    while ((isborder(r,Sud))&&(isborder(r,West)))==false
        if isborder(r,Sud)==false
            move!(r,Sud)
            push!(act,0)
        else
            move!(r,West)
            push!(act,1)
        end
        num+=1
    end
    for _ in 1:4
        while isborder(r,side)==false
            move!(r,side)
        end
        putmarker!(r)
        side=next(side)
    end
    num-=1
    while (num>0)==true
        if act[num]==0
            move!(r,Nord)
        else
            move!(r,Ost)
        end
        num-=1
    end
end

next(side::HorizonSide)=HorizonSide(mod(Int(side)+3,4))