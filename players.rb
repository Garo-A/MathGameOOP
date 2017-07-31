class Player
  attr_accessor :name, :lives

  def initialize(name)
    self.name = name
    self.lives = 3
  end

  def lose_life
    self.lives -= 1
  end

end

# player1 = Player.new("Player1")
# puts player1.lives
