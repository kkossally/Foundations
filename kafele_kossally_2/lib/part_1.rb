def my_reject(arr, &prc)
    rejected = []

    arr.each { |e| rejected << e if !prc.call(e) }

    rejected
end

def my_one?(arr, &prc)
    count = 0

    arr.each { |e| count += 1 if prc.call(e) }

    if count == 1
        return true
    else
        return false
    end
end

def hash_select(hsh, &prc)
    selected = Hash.new

    hsh.each do |k, v| 
        if prc.call(k, v)
            selected[k] = v
        end
    end
    
    selected
end

def xor_select(arr, prc_1, prc_2)
    selected = []

    arr.each { |e| selected << e if (prc_1.call(e) || prc_2.call(e)) && !(prc_1.call(e) && prc_2.call(e)) }

    selected
end

def proc_count(val, prcs)
    count = 0

    prcs.each { |prc| count += 1 if prc.call(val) }

    count
end