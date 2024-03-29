def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    # urls.none? { |url| url.end_with?(".com") || url.end_with?(".net") || url.end_with?(".io") || url.end_with?(".org") }

    valid_endings = ['.com', '.net', '.io', '.org']

    urls.none? do |url|
        valid_endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(students)
    students.any? { |student| student[:grades].sum / student[:grades].length >= 75 }
end