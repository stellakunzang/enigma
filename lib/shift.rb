require_relative "defaultable"

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

  def keys
    index_start = 0
    keys_found = []
    until keys_found.length == 4
      keys_found << @key[index_start, 2]
      index_start += 1
    end
    keys_found.map {|key| key.to_i }
  end

  def get_shifts
    key_offset_pairs = keys.zip(offsets)
    @shifts = key_offset_pairs.map do |pair|
      pair.sum
    end
  end

end
