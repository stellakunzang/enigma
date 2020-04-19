module Abcdable

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
