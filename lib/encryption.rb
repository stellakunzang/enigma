require_relative "abcdable"
require_relative "defaultable"
require_relative "shift"

class Encryption < Shift

  include Abcdable
  include Defaultable

  attr_reader :indexes,
              :encrypted_message

  def initialize(text, key = randomize, date = today)
    @text = super
    @key = super
    @date = super
    @shifts = super
    @encrypted_message = [].join
  end

  def turn(position, letter)
    local_alphabet = alphabet.rotate(shifts_pairs[position.to_sym])
    new_letter = local_alphabet[alphabet_index[letter]]
    @encrypted_message << new_letter
    @indexes[position.to_sym] += 4
  end

  def encrypt_letter(index, letter)
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
    raw_text = @text.split("")
    raw_text.each.with_index do |letter, index|
      if !alphabet.include?(letter)
        advance_symbol_index(index)
        @encrypted_message << letter
      else
        encrypt_letter(index, letter)
      end
    end
  end

end
