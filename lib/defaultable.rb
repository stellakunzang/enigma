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

  def alphabet_index
    alphabet_with_index = {}
    @alphabet.to_enum.with_index do |letter, index|
      alphabet_with_index[letter] = index
    end
    alphabet_with_index
  end

end
