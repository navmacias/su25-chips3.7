class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service
  attr_reader :word


  def initialize(word)
    @word = word
    @guesses = []
  end

  def guesses 
    @guesses 
  end 


  def guess(letter)
    raise ArgumentError, "Invalid input" if letter.nil? 
    letter = letter.downcase
    return false if @guesses.include?(letter)

    @guesses << letter 
    true 
  end

  def wrong_guesses
    @guesses.select {|c| !@word.include?(c)}
  end
  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word

  def word_with_guesses 
    @word.chars.map { |c| @guesses.include?(c)? c: '-'}.join 
  end

  def won?
    word_with_guesses == @word
  end

  def lost?
    !won? && wrong_guesses.size >= 7
  end
  

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start do |http|
      return http.post(uri, "").body
    end
  end
end
