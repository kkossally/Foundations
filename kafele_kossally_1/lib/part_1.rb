def is_prime?(num)

    return false if num < 2

    (2...num).each do |divisor|
        return false if num % divisor == 0
    end

    return true
end

def nth_prime(num)
    primes = []

    prime = 2
    while primes.length < num
        primes << prime if is_prime?(prime)
        prime += 1
    end

    primes[-1]
end

def prime_range(min, max)
    primes = []

    (min..max).each do |prime|
        primes << prime if is_prime?(prime)
    end

    primes
end