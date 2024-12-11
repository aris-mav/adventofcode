function day_seven(file)

    sum = open(file) do io
        sum = 0
        while !eof(io)

            v = parse.(Int, filter.(isdigit, split(readline(io), " ")))

            for d in digits.(0:(2^(length(v)-2)-1), base=2, pad=length(v)-2)

                value = v[2]

                for (i,operation) in enumerate(Bool.(d))
                    operation ? value = value + v[i+2] : value = value * v[i+2]
                end

                if value == v[1]
                    sum += value
                    break
                end
            end
        end
        return sum
    end
end
