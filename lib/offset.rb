class Offset
  attr_reader :date_squared, :last_four

  def initialize(date = today)
    @date_squared ||= square_date(date).to_s
    @last_four = @date_squared[-4..-1]
  end

  def today
    (Date.today.strftime("%d%m%y")).to_s
  end

  def square_date(date)
    date = date.to_i
    date * date
  end

  def offsets
    offsets = @last_four.split("")
    offsets.map {|number| number.to_i}
  end

end
