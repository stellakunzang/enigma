require "Date"
module Defaultable

  def randomize
    rand(5 ** 5).to_s.rjust(5, '0')
  end

  def today
    (Date.today.strftime("%d%m%y")).to_s
  end

  def square_date(date)
    date = date.to_i
    date * date
  end


end
