require_relative "defaultable"

class Shift

  include Defaultable

  attr_reader :text, :key, :date, :date_squared, :last_four, :alphabet, :shifts

  def initialize(text, key = randomize, date = today)
    @text = text.downcase
    @key ||= key.to_s
    @date = date
    @date_squared ||= square_date(date).to_s
    @last_four = @date_squared[-4..-1]
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @alphabet_index ||= alphabet_index
    @shifts = get_shifts
  end

  def square_date(date)
    date = date.to_i
    date * date
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

  def alphabet_index
    alphabet_with_index = {}
    @alphabet.to_enum.with_index do |letter, index|
      alphabet_with_index[letter] = index
    end
    alphabet_with_index
  end

  def get_shifts
    key_offset_pairs = keys.zip(offsets)
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
      if !alphabet.include?(letter)
        encrypted_message << letter
      else 
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
    end
    encrypted_message.join
  end

end
