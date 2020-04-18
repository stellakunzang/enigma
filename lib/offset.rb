class Offset
  attr_reader :date_squared, :last_four

  def initialize(date = today)
    @date_squared ||= square_date(date).to_s
  end
end 
