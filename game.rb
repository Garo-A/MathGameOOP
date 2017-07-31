class Game

  attr_accessor :player_1, :player_2, :question, :turn

  def initialize()
    self.player_1 = Player.new("Player 1")
    self.player_2 = Player.new("Player 2")
    self.question = Question.new
    self.turn = 1
  end

  def current_player
    if self.turn == 1
      player_1
    else
      player_2
  end
end

  def next_turn
    puts "--- NEXT TURN ---"
    if self.turn == 1
      self.turn = 2
    elsif self.turn == 2
      self.turn = 1
  end
end

  def game_over
    puts "--- GAME OVER ---"
  end

  def print_question
     puts "#{current_player.name}: What is #{self.question.first_number} plus #{self.question.second_number}"
   end

   def ongoing?
     self.player_1.lives > 0 && self.player_2.lives > 0
   end

  def get_winner
    if self.player_1.lives == 0
      puts "The winner is Player 2 with #{player_2.lives}/3 lives!"
    else
      puts "The winner is Player with #{player_1.lives}/3! lives"
    end
  end

  def answer_evaluation(answer)
    if answer == self.question.answer
      puts "YES! You are correct!"
      self.question.set_numbers
      next_turn
    else
      current_player.lose_life
      puts "Seriously? No!"
      self.question.set_numbers
      next_turn
    end
  end

  def game_start
    while (ongoing?)
      print_question
      print "#{current_player.name} >"
      current_answer = gets.chomp.to_i
      answer_evaluation(current_answer)
    end
    game_over
    get_winner
  end
end
