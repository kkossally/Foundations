def reverser(str, &prc)
    # reverse_str = ""

    # i = str.length - 1
    # while i >= 0
    #     reverse_str += str[i]
    #     i -= 1
    # end

    # prc.call(reverse_str)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    new_sentence = []
    
    sentence.split.each { |word| new_sentence << prc.call(word) }

    new_sentence.join(' ')
end

def greater_proc_value(num, prc_1, prc_2)
    [prc_1.call(num), prc_2.call(num)].max
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []

    arr.each { |ele| new_arr << ele if prc_1.call(ele) && prc_2.call(ele) }

    new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    mapped = []

    arr.each_with_index do |e, i|
        # if i % 2 == 0
        if i.even?
            mapped << prc_1.call(e)
        else
            mapped << prc_2.call(e)
        end
    end

    mapped
end