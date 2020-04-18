require_relative "defaultable"

class Unshift

  include Defaultable

  attr_reader :text, :key, :date, :date_squared, :last_four, :alphabet

  def initialize(text, key, date = today)
    @text = text
    @key = key
    @date = date
    @date_squared ||= square_date(date).to_s
    @last_four = @date_squared[-4..-1]
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @alphabet_index ||= alphabet_index
  end


end
