# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    vowels = "aeiou".split('')    # create array of vowels
    str.split('').all? { |letter| vowels.include?(letter) } # split str & check if all letters are in vowels
end

p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


