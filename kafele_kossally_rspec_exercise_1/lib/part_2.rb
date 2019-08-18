# def hipsterfy(str)
#     begin
#         str[str.rindex(/[aeiou]/)] = ""
#         str
#     rescue
#         str
#     end
# end

def hipsterfy(str)
   vowels = "aeiou"

   i = str.length - 1
   while i >= 0
        if vowels.include?(str[i])
            return str[0...i] + str[i+1..-1]
        end

        i -= 1
   end
   
   str
end

def vowel_counts(str)
    # str.downcase!
    vowels = "aeiou"
    vowel_counts = Hash.new(0)

    str.each_char do |letter|
        vowel_counts[letter.downcase] += 1 if vowels.include? letter.downcase
    end

    vowel_counts
end

# def caesar_cipher(message, num)
#     alphabet = Hash.new
#     "abcdefghijklmnopqrstuvwxyz".each_char { |char| alphabet[char] = char.ord-96 }

#     characters = message.split('')

#     characters.map! do |char|
#         if "abcdefghijklmnopqrstuvwxyz".include? char
#             alphabet.key((char.ord - 96 + num)%26)
#         else
#             char
#         end
#     end
#     characters.join('')
# end

def caesar_cipher(message, num)
   alphabet = ("a".."z").to_a
   cipher = ""

   message.each_char do |char|
        if alphabet.include? char
            cipher += alphabet[(alphabet.index(char) + num) % 26]
        else
            cipher += char
        end
   end

   cipher
end