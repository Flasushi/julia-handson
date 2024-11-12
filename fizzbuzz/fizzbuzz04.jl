function fizzbuzz(n)
    if (i = n) % 15 == 0
        "FizzBuzz"
    elseif i % 3 == 0
        "Fizz"
    elseif i % 5 == 0
        "Buzz"
    else
        i
    end
end

println.(fizzbuzz.(1:100))