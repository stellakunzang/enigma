class Shift

  attr_reader :text, :key, :date

  def initialize(text, key = nil, date = nil)
    @text = text
    @key = key
    @date = date
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def get_keys(key)
    if key == nil
      cypher_key = Key.new
    else
      cypher_key = Key.new(key)
    end
    cypher_key.keys
  end

  def get_offsets(date)
    if date == nil
      offset = Offset.new
    else
      offset = Offset.new(date)
    end
    offset.offsets
  end

end
