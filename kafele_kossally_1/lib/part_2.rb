def element_count(arr)
    counts = Hash.new(0)

    arr.each { |e| counts[e] += 1 }
    
    counts
end

def char_replace!(str, hash)

    str.each_char.with_index do |char, i|
        str[i] = hash[char] if hash.has_key?(char)
    end

    str
end

def product_inject(numbers)
    numbers.inject(1) { |product, number| product *= number}
end