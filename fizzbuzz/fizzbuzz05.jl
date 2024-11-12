function fizzbuzz(n)
    fizzbuzz = 0:15:n
    fizz = 0:3:n
    buzz = 0:5:n

    for i in 1:n
        if i in fizzbuzz
            println("FizzBuzz")
        elseif i in fizz
            println("Fizz")
        elseif i in buzz
            println("Buzz")
        else
            println(i)
        end
    end
end

fizzbuzz(100)