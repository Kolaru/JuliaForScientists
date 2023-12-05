using DelimitedFiles

begin
    n = 12

    points = map(1:n) do i
        θ =  i/n * 2π
        [cos(θ), sin(θ)]
    end

    points = hcat(points...)
    charges = ones(n)
    charges[1:2:n] .= -1
    data = vcat(
        permutedims(["q", "x", "y"]),
        hcat(charges, points')
    )


    writedlm("data/point_charges.csv", data, ',')
end