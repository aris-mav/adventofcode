using DelimitedFiles

A = readdlm("data.txt")

a = sort(A[:,1])  
b = sort(A[:,2])

sum(abs.(a .- b))

score = 0
for x in a
    score += x * count(x .== b)
end
