function fizzbuzz(n)
    fizzbuzz = 0:15:n
    fizz = 0:3:n
    buzz = 0:5:n

    while n > 0
        if n in fizzbuzz
            println("FizzBuzz")
        elseif n in fizz
            println("Fizz")
        elseif n in buzz
            println("Buzz")
        else
            println(n)
        end
        n -= 1
    end
end

fizzbuzz(100)