function fizzbuzz(n)
    if n % 15 == 0
        "FizzBuzz"
    elseif n % 3 == 0
        ("Fizz")
    elseif n % 5 == 0
        ("Buzz")
    else
        n
    end
end

println.(fizzbuzz.(1:100))