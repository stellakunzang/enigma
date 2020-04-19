require_relative "defaultable"
# require_relative "abcdable"

class Shift

  include Defaultable

  attr_reader :text,
              :key,
              :date,
              :date_squared,
              :last_four

  def initialize(text, key = randomize, date = today)
    @text = text.downcase
    @key = key.to_s
    @date = date
    @date_squared = square_date(date).to_s
    @last_four = last_four(date)
    @shifts = get_shifts
  end

  def square_date(date)
    date = date.to_i
    date * date
  end

  def last_four(date)
    @date_squared[-4..-1]
  end

  def offsets
    offsets = @last_four.split("")
    offsets.map {|number| number.to_i}
  end

  def a
    @key[0..1].to_i
  end

  def b
    @key[1..2].to_i
  end

  def c
    @key[2..3].to_i
  end

  def d
    @key[3..4].to_i
  end

  def keys
    [a, b, c, d]
  end

  def get_shifts
    key_offset_pairs = keys.zip(offsets)
    @shifts = key_offset_pairs.map do |pair|
      pair.sum
    end
  end

end
