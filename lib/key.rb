class Key
  attr_reader :number

  def initialize(number = randomize)
    @number ||= number.to_s
  end

  def randomize
    rand(5 ** 5).to_s.rjust(5, '0')
  end
  
end
