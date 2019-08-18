# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        # return nil if self.length == 0
        return nil if self.empty?
        self.max - self.min
    end

    def average
        # return nil if self.length == 0
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        # return nil if self.length == 0
        return nil if self.empty?

        sorted = self.sort

        if sorted.length.odd?
            return sorted[sorted.length / 2]
        else
            mid_1 = sorted[sorted.length / 2 - 1]
            mid_2 = sorted[sorted.length / 2]
            return [mid_1, mid_2].average
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |e| count[e] += 1 }
        count
    end

    def my_count(val)
        self.counts[val]
    end

    def my_index(val)
        self.each_with_index { |e, i| return i if e == val }
        nil
    end
  
    def my_uniq
        # unique = []
        # self.each do |e|
        #     unique << e if !unique.include?(e)
        # end
        # unique
        self.counts.keys
    end

    def my_transpose
        transposition = []

        self.each_index do |row|
            new_row = []
            self.each_index do |col| # works as a way to iterate through columns 
    # because the array has square dimensions, if it didn't, would have to use a
    # different tracker for rows and columns
        
                new_row << self[col][row]
            end
            transposition << new_row
        end

        transposition
    end
end