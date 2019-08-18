# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (1..num_1 * num_2).each do |i|
        return i if i % num_1 == 0 && i % num_2 == 0
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    frequencies = Hash.new(0)

    (0...str.length-1).each do |i|
        bigram = str[i] + str[i+1]
        frequencies[bigram] += 1
    end

    frequencies.key(frequencies.values.max) # could also sort by the values of the hash (sorted = frequencies.sort_by { |k, v| v})
    # that returns a 2D array where each subarray is a pair of key and value from the hash where the last element is the pair with the highest value
    # so the most frequently occuring bigram is the first element of the last subarray (sorted.last[0]) 
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inverted = Hash.new
        self.each { |k, v| inverted[v] = k }
        inverted
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0

        self.each_with_index do |el_1, idx_1|
            self.each_with_index do |el_2, idx_2|
                count += 1 if idx_2 > idx_1 && el_1 + el_2 == num
            end
        end
        count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }

        sorted = false

        until sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self [i]
                    sorted = false
                end
            end
        end

       self
    end
end
