require_relative "shift"

class Decryption < Shift

  attr_reader :decrypted_message

  def initialize(text, key = randomize, date = today)
    @text = super
    @key = super
    @date = super
    @shifts = super
    @decrypted_message = [].join
  end

  def neg_shifts_pairs
    negative_pairs = {}
    shifts_pairs.map do |letter, digit|
      negative_pairs[letter] = - digit
    end
    negative_pairs
  end

  def reverse(position, letter)
    local_alphabet = alphabet.rotate(neg_shifts_pairs[position.to_sym])
    new_letter = local_alphabet[alphabet_index[letter]]
    @decrypted_message << new_letter
    @indexes[position.to_sym] += 4
  end

  def decrypt_letter(index, letter)
    if index == @indexes[:a]
      reverse("a", letter)
    elsif index == @indexes[:b]
      reverse("b", letter)
    elsif index == @indexes[:c]
      reverse("c", letter)
    elsif index == @indexes[:d]
      reverse("d", letter)
    end
  end

  def decrypt_message
    raw_text = @text.split("")
    raw_text.each.with_index do |letter, index|
      if !alphabet.include?(letter)
        advance_symbol_index(index)
        @decrypted_message << letter
      else
        decrypt_letter(index, letter)
      end
    end
  end

end
