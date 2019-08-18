# def partition(arr, num)
#     under = arr.select { |e| e < num }
#     over = arr.select { |e| e >= num }
#     [under, over]
# end

def partition(arr, num)
    [arr.select { |e| e < num }, arr.select { |e| e >= num }]
end

def merge(hash_1, hash_2)
    merged = Hash.new

    hash_1.each { |key, val| merged[key] = val }
    hash_2.each { |key, val| merged[key] = val }

    merged
end

def censor(sentence, curses)

    censored_sentence = sentence.split.map do |word|

        if curses.include?(word.downcase)
            word.each_char.with_index do |char, i|
                 word[i] = "*" if "aeiou".include?(char.downcase)
            end
        end
        
        word
    end

    censored_sentence.join(' ')
end

# def power_of_two?(num)
#     return true if num == 1
    
#     while num > 2
#         num /= 2
#         return true if num == 2
#     end

#     false
# end

def power_of_two?(num)
    product = 1    

    while product < num
        product *= 2
    end

    product == num
end