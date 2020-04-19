require_relative "abcdable"
require_relative "defaultable"
require_relative "shift"

class Encrypt < Shift

  include Abcdable
  include Defaultable

  attr_reader :indexes,
              :encrypted_message

  def initialize(text, key = randomize, date = today)
    @text = super
    @key = super
    @date = super
    @shifts = super
    @indexes = set_indexes
    @encrypted_message = [].join
  end

  def turn(position, letter)
    local_alphabet = alphabet.rotate(shifts_pairs[position.to_sym])
    new_letter = local_alphabet[alphabet_index[letter]]
    @encrypted_message << new_letter
    @indexes[position.to_sym] += 4
  end

  def encrypt(index, letter)
    if index == @indexes[:a]
      turn("a", letter)
    elsif index == @indexes[:b]
      turn("b", letter)
    elsif index == @indexes[:c]
      turn("c", letter)
    elsif index == @indexes[:d]
      turn("d", letter)
    end
  end

  def encrypt_message
    raw_text = @text.split("").to_enum
    raw_text.with_index do |letter, index|
      if !alphabet.include?(letter)
        @encrypted_message << letter
      else
        encrypt(index, letter)
      end
    end
  end

end
