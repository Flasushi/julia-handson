#Julia version: 1.7
using FFMPEG

macro convert_path(file_path)
    quote
        gray_image_path = split($file_path, ".png")[end-1] * "_gray.png"
    end
end

macro file_delete(file_path)
    quote
        rm(@convert_path($file_path))
    end
end

function gray_image(file_path)
    encoder_options = ["-i", file_path, "-vf", "format=gray", @convert_path(file_path)]
    if FFMPEG.exe(`$encoder_options`) == 0
        return view(@convert_path(file_path))
    else
        return "Execution error"
    end
end

file_path = "./motion/image.png"

if isfile(@convert_path(file_path))
    @file_delete(file_path)
    println("File deleted")
else
    gray_image(file_path)
end
print("hello ffmpeg")