function great_painter(r::Robot)
    side=Ost
    num_hor=moves!(r,West)
    num_ver=moves!(r,Sud)
    mark=1-2*mod(num_ver+num_hor,2)
    while (mark>10)==false
        if (mark>-1)==true
            putmarker!(r)
        end
        while isborder(r,side)==false
            move!(r,side)
            mark*=-1
            if (mark>-1)==true
                putmarker!(r)
            end
        end
        side=inverse(side)
        if isborder(r,Nord)==true
            mark=11
        else
            move!(r,Nord)
            mark*=-1
        end
    end
    moves!(r,Sud)
    moves!(r,West)
    move_back(r,Nord,num_ver)
    move_back(r,Ost,num_hor)
end

    function moves!(r::Robot,side::HorizonSide)
        num_steps=0
        while isborder(r,side)==false
            move!(r,side)
            num_steps+=1
        end
        return num_steps
    end

    function move_back(r::Robot,side::HorizonSide,num_steps::Int)
        if (num_steps<0)==true
            side=inverse(side)
            num_steps*=-1
        end
        for _ in 1:num_steps
            move!(r,side)
        end
    end
    
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))