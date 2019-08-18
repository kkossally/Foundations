# def palindrome?(str)
#     reversed = ""

#     i = str.length - 1
#     while i >= 0
#         reversed += str[i]
#         i -= 1
#     end
    
#     str == reversed
# end

def palindrome?(str)
    str.each_char.with_index do |char, i|
        return false if str[i] != str[-i - 1]
    end

    true
end

# def substrings(str)
#     substrings = []

#     str.each_char.with_index do |char, idx|
#         i = idx
#         while i < str.length
#             substrings << str[idx..i]
#             i += 1
#         end
#     end

#     substrings
# end

def substrings(str)
    substrings = []

    (0...str.length).each do |start_idx|
        (start_idx...str.length).each do |end_idx|
            substrings << str[start_idx..end_idx]
        end
    end

    substrings
end

def palindrome_substrings(str)
    substrings(str).select { |substr| palindrome?(substr) && substr.length > 1 }
end