class Question

  attr_accessor :first_number, :second_number

  def initialize()
    self.first_number = random_number
    self.second_number = random_number
  end

  def random_number
    Random.new.rand(1..20)
  end

  def set_numbers
    self.first_number = random_number
    self.second_number = random_number
  end

  def answer
    first_number + second_number
  end

end
