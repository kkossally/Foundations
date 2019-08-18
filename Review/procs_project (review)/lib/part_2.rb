def reverser(str, &proc)
    proc.call(str.reverse)
end

def word_changer(sentence, &proc)
    new_sent = []
    sentence.split.each { |word| new_sent << proc.call(word) }

    new_sent.join(" ")
end

def greater_proc_value(num, proc1, proc2)
    [proc1.call(num), proc2.call(num)].max
end

def and_selector(arr, proc1, proc2)
    arr.select { |ele| proc1.call(ele) && proc2.call(ele) }
end

def alternating_mapper(arr, proc1, proc2)
    arr.map do |ele|
        arr.index(ele).even? ? proc1.call(ele) : proc2.call(ele) 
    end
end