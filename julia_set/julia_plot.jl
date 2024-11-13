using Plots
using Printf
using FileIO

c = complex(0.0, 0.745)
initial_ylim = (-0.8, 1.0) #縦
initial_xlim = (-2.0, 2.0) #横
zoom_factor = 0.99
n_frames = 120
file_path = "./julia_set/julia_set.gif"

function julia_set(c, xlim, ylim, max_iter=100, resolution=500)
    x_range = range(xlim[1], stop=xlim[2], length=resolution)
    y_range = range(ylim[1], stop=ylim[2], length=resolution)
    img = fill(0, resolution, resolution)
     for i in 1:resolution
        for j in 1:resolution
            z = complex(x_range[i], y_range[j])
            iter = 0
            while abs(z) ≤ 2 && iter < max_iter
                z = z^2 + c
                iter += 1
            end
            img[j, i] = iter
        end
    end

    heatmap(x_range, y_range, img, color=:viridis, reverse=true, legend=false)
end

function gif_save(file_path)
    anim = Animation()
    for i in 1:n_frames
        xlim = (initial_xlim[1] * zoom_factor^i, initial_xlim[2] * zoom_factor^i)
        ylim = (initial_ylim[1] * zoom_factor^i, initial_ylim[2] * zoom_factor^i)
        julia_set(c, xlim, ylim)
        title_str = @sprintf("Zoom iteration: %d", i)
        plot!(title=title_str)
        frame(anim)
    end
    gif(anim, file_path, fps=30)
end

if isfile(file_path)
    rm(file_path)
end
gif_save(file_path)