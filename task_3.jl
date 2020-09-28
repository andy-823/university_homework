function great_painter(r::Robot)
    wall=false
    plus=-1
    side=Ost
    num_ver=moves!(r,Sud,plus)
    num_hor=moves!(r,West,plus)
    putmarker!(r)
    while wall==false
        plus*=-1
        putmarker!(r)
        num_hor+=moves!(r,side,plus)
        side=inverse(side)
        if isborder(r,Nord)==true
            wall=true
        else
            move!(r,Nord)
            num_ver+=1
        end
    end
    if side==Ost
        num_hor*=-1
    end
    move_back(r,Sud,num_ver)
    move_back(r,side,num_hor)
end

function moves!(r::Robot,side::HorizonSide,plus::Int)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    num_steps+=plus
    end
    return num_steps
end

function move_back(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps
        move!(r,side)
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))