def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(arr)
    arr.sum / arr.length.to_f # OR (arr.length * 1.0)
end

def repeat(str, num)
    str * num # OR num.times { new_string += string } and return new_string
end

def yell(str)
    str.upcase + "!"
end

# def alternating_case(sentence)
#     words = sentence.split
#     new_words = Array.new

#     words.each_with_index do |word, i|
#         if i.even?
#             new_words << word.upcase
#         else
#             new_words << word.downcase
#         end
#     end

#     new_words.join(" ")
# end

def alternating_case(sentence)
    words = sentence.split

    new_words = words.map.with_index do |word, i|
        if i.even?
            word.upcase
        else
            word.downcase
        end
    end

    new_words.join(" ")
end