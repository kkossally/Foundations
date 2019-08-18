# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

# def largest_prime_factor(num)
#     prime_factors = []

#     (2..num).each do |divisor|
#         if is_prime?(divisor) && num % divisor == 0
#             prime_factors << divisor
#         end
#     end

#     prime_factors[-1]
# end

def largest_prime_factor(num)
    num.downto(2) do |factor|
        return factor if num % factor == 0 && is_prime?(factor)
    end
end

def is_prime?(num)

    return false if num < 2
    # (2...num).each { |divisor| return false if num % divisor == 0 }
    (2...num).none? { |divisor| num % divisor == 0}
    # true
end

# def unique_chars?(str)

#     str.each_char.with_index do |char, idx|
#         str[idx+1..-1].each_char do |other_char|
#             return false if char == other_char
#         end
#     end
    
#     true
# end

def unique_chars?(str)
    already_seen = []

    str.each_char do |char|
        return false if already_seen.include?(char)
        already_seen << char
    end
    
    true
end

# def dupe_indices(arr)
#     indices = {}

#     arr.each_with_index do |e, i|
#         arr[i+1..-1].each do |e2|
#             indices[e] = [] if e == e2
#         end
#     end

#     indices.keys.each do |key|
#         indices[key] = arr.each_index.select { |i| arr[i] == key }
#     end
    
#     indices
# end

def dupe_indices(arr)
    indices = Hash.new { |hash, key| hash[key] = [] }

    arr.each_with_index do |e, i|
        indices[e] << i
    end
    
    indices.select { |e, arr| arr.length > 1 }
end

def ana_array(arr_1, arr_2)

    # return false if arr_1.length != arr_2.length
    
    # arr_1.each do |e|
    #     return false if !arr_2.include?(e)
    # end

    # return false if el_count(arr_1) != el_count(arr_2)

    # return true
    el_count(arr_1) == el_count(arr_2)
end

def el_count(arr)
    counts = Hash.new(0)

    arr.each { |e| counts[e] += 1 }

    counts
end