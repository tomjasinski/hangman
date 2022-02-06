class Hangman

    def initialize
      @lives = 10
      @incorrect_guesses = []
      words = ["cricket", "nowe"]
      @word = words.sample
      @word_teasers = Array.new(@word.length, '_')
    end

    def playing
      puts "\nYou have #{@lives} lives. Your incorrect guesses are: #{@incorrect_guesses}. Your word is #{@word_teasers.join(' ')}. Your guess: "
      guess = gets.chomp
      if guess == "exit"
         puts "Thank you for playing!"
      elsif @lives == 0
        puts "You've lost! The word was #{@word}"  
      elsif guess.length < 2
        is_correct = @word.include? guess
        if is_correct && !(@word_teasers.include? guess)
          puts "Correct guess!"
          idx = []
          @word.each_char.with_index do |char, indx|
            idx << indx if char == guess
          end
          idx.each do |indx|
            @word_teasers[indx] = guess
          end
          if @word_teasers.join == @word
            puts "You've won!"
          else
            playing
          end
        elsif !is_correct && !(@incorrect_guesses.include? guess)
          @lives -= 1
          puts "That's incorrect guess!"
          @incorrect_guesses << guess
          playing
        else
          puts "you've got this letter earlier!"
          playing
        end
      else
        puts "Give one letter!"
        playing
      end
    end
    
    def begin
      puts "New game started. Your word is #{@word.length} characters long"
      puts "To exit game type 'exit'"

      playing
    end

end

game = Hangman.new
game.begin

   