using UnicodePlots 

tiles = [101, 103]
file = "data.txt"

function advance!(p, v, tiles)
    p .+= v
    for xy in p
        xy .= mod.(xy, tiles)
    end
end

function pt1(file, tiles)

    print("\33[2J")

    numbers = [
        parse.(Int, filter(!isempty, split(xyxy,(',',' ','p','v','='))))
        for xyxy in readlines(file)
    ]

    floor = zeros(Int, tiles[1], tiles[2])
    p = getindex.(numbers, [1:2]);
    v = getindex.(numbers, [3:4]);

    for _ in 1:100
        sleep(0.03)
        advance!(p, v, tiles)
        floor .= 0
        for xy in p
            floor[(xy.+1)...] += 1
        end
        print("\33[H")
        println(heatmap(floor'))
        
    end

    f = collect(floor')

    q1 = sum(f[1:size(f,1)÷2, 1:(size(f,2)÷2)])
    q2 = sum(f[1:size(f,1)÷2, (size(f,2)÷2)+2:end])
    q3 = sum(f[(size(f,1)÷2)+2:end , 1:(size(f,2)÷2)])
    q4 = sum(f[(size(f,1)÷2)+2:end , (size(f,2)÷2)+2:end])

    sf = q1 * q2 * q3 * q4
    println("The safety factor is:")
    return sf

end

function pt2(file, tiles) #WIP
    numbers = [
        parse.(Int, filter(!isempty, split(xyxy,(',',' ','p','v','='))))
        for xyxy in readlines(file)
    ]

    floor = zeros(Int, tiles[1], tiles[2])
    p = getindex.(numbers, [1:2]);
    v = getindex.(numbers, [3:4]);

    print("\33[2J")
    time = 0
    while true
        sleep(0.1)
        advance!(p, v, tiles)
        floor .= 0
        for xy in p
            floor[(xy.+1)...] += 1
        end
        print("\33[H")
        println(heatmap(floor'))
        time += 1
        if condition
            println("tree at t= $(time)")
            break
        end
    end

end
