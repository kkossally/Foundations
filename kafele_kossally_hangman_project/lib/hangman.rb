class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each_char.with_index do |c, i|
      matching_indices << i if char == c
    end
    matching_indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char
    @remaining_incorrect_guesses -= 1 if !@secret_word.include? char

    fill_indices(char,get_matching_indices(char))    
    true
  end

  def ask_user_for_guess
    print "Enter a char: "
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join('') == @secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end

end