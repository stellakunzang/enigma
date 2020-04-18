class Shift

  attr_reader :text, :key, :date, :alphabet, :keys, :offsets

  def initialize(text, key = nil, date = nil)
    @text = text.downcase
    @key = key
    @date = date
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @alphabet_index ||= alphabet_index
    @keys = nil
    @offsets = nil
    @shifts = nil
  end

  def alphabet_index
    alphabet_with_index = {}
    @alphabet.to_enum.with_index do |letter, index|
      alphabet_with_index[letter] = index
    end
    alphabet_with_index
  end

  def get_keys(key)
    if key == nil
      cypher_key = Key.new
    else
      cypher_key = Key.new(key)
    end
    @keys = cypher_key.keys
  end

  def get_offsets(date)
    if date == nil
      offset = Offset.new
    else
      offset = Offset.new(date)
    end
    @offsets = offset.offsets
  end

  def get_shifts
    key_offset_pairs = @keys.zip(@offsets)
    @shifts = key_offset_pairs.map do |pair|
      pair.sum
    end
  end

  def encrypt_message
    shift_a = @shifts[0]
    shift_b = @shifts[1]
    shift_c = @shifts[2]
    shift_d = @shifts[3]
    index_a = 0
    index_b = 1
    index_c = 2
    index_d = 3

    alphabet_a = alphabet.rotate(shift_a)
    alphabet_b = alphabet.rotate(shift_b)
    alphabet_c = alphabet.rotate(shift_c)
    alphabet_d = alphabet.rotate(shift_d)

    encrypted_message = []

    raw_text = @text.split("").to_enum
    raw_text.with_index do |letter, index|
      if index == index_a
        new_letter = alphabet_a[@alphabet_index[letter]]
        encrypted_message << new_letter
        index_a += 4
      elsif index == index_b
        new_letter = alphabet_b[@alphabet_index[letter]]
        encrypted_message << new_letter
        index_b += 4
      elsif index == index_c
        new_letter = alphabet_c[@alphabet_index[letter]]
        encrypted_message << new_letter
        index_c += 4
      elsif index == index_d
        new_letter = alphabet_d[@alphabet_index[letter]]
        encrypted_message << new_letter
        index_d += 4
      end
    end
    encrypted_message.join
  end

end
