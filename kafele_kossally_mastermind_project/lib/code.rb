class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.key?(char.upcase) }
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(string)
    Code.new(string.split(''))
  end

  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise "at least one of these pegs is not valid"
    else
      @pegs = chars.map(&:upcase)
    end
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def ==(other_code)
    other_code.pegs == self.pegs
  end

  def num_exact_matches(guess_code)
    exact_matches = 0
    guess_code.pegs.each_index { |i| exact_matches += 1 if guess_code[i] == self[i] }
    exact_matches
  end

  def num_near_matches(guess_code)
    near_matches = 0

    guess_code.pegs.each_index do |i|
      near_matches += 1 if guess_code[i] != self[i] && self.pegs.include?(guess_code[i])
    end

    near_matches
  end
end