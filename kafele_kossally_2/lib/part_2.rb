def proper_factors(num)
    factors = []

    (1...num).each { |divisor| factors << divisor if num % divisor == 0 }

    factors
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    numbers = []

    i = 1
    while numbers.length < n
        numbers << i if perfect_number?(i)
        i += 1
    end

    numbers
end