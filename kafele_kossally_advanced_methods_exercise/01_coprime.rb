# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    if find_factors(num_1).length > find_factors(num_2).length
        find_factors(num_2).one? { |factor| find_factors(num_1).include?(factor) }
    else
        find_factors(num_1).one? { |factor| find_factors(num_2).include?(factor) }
    end
end

def find_factors(num) # find factors of a number
    factors = []
    (1..num).each { |n| factors << n if num % n == 0 }
    factors
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
