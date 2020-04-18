class Key
  attr_reader :number

  def initialize(number = randomize)
    @number ||= number.to_s
  end

  def randomize
    rand(5 ** 5).to_s.rjust(5, '0')
  end

  def a
    number[0..1].to_i
  end

  def b
    number[1..2].to_i
  end

  def c
    number[2..3].to_i
  end

  def d
    number[3..4].to_i
  end

  def keys
    [a, b, c, d]
  end
  
end
