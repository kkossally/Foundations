def select_even_nums(numbers)
    numbers.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |sub_arr| sub_arr.sum > 0 }
end

def aba_translate(word)
    translation = ""
    word.each_char do |char|
        if "aeiou".include?(char)
            translation += char + "b" + char
        else
            translation += char
        end
    end
    translation
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end