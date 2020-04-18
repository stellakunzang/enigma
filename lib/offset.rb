class Offset
  attr_reader :date_squared, :last_four

  def initialize(date = today)
    @date_squared ||= square_date(date).to_s
  end

  def today
    (Date.today.strftime("%d%m%y")).to_s
  end

  def square_date(date)
    date = date.to_i
    date * date
  end

  def a
    date_squared[-4].to_i
  end

  def b
    date_squared[-3].to_i
  end

  def c
    date_squared[-2].to_i
  end

  def d
    date_squared[-1].to_i
  end

  def offsets
    [a, b, c, d]
  end

end
