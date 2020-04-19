require_relative "defaultable"
require_relative "abcdable"

class Unshift

  include Defaultable
  include Abcdable

  attr_reader :text, :key, :date, :date_squared, :last_four, :unshifts

  def initialize(text, key, date = today)
    @text = text
    @key = key
    @date = date
    @date_squared ||= square_date(date).to_s
    @last_four = @date_squared[-4..-1]
    @alphabet = alphabet
    @alphabet_index ||= alphabet_index
    @unshifts = get_shifts
  end

  def decrypt_message
    index_a = 0
    index_b = 1
    index_c = 2
    index_d = 3

    alphabet_a = alphabet.rotate(neg_shifts_pairs[:a])
    alphabet_b = alphabet.rotate(neg_shifts_pairs[:b])
    alphabet_c = alphabet.rotate(neg_shifts_pairs[:c])
    alphabet_d = alphabet.rotate(neg_shifts_pairs[:d])

    decrypted_message = []

    raw_text = @text.split("").to_enum
    raw_text.with_index do |letter, index|
      if !alphabet.include?(letter)
        decrypted_message << letter
      else
        if index == index_a
          new_letter = alphabet_a[@alphabet_index[letter]]
          decrypted_message << new_letter
          index_a += 4
        elsif index == index_b
          new_letter = alphabet_b[@alphabet_index[letter]]
          decrypted_message << new_letter
          index_b += 4
        elsif index == index_c
          new_letter = alphabet_c[@alphabet_index[letter]]
          decrypted_message << new_letter
          index_c += 4
        elsif index == index_d
          new_letter = alphabet_d[@alphabet_index[letter]]
          decrypted_message << new_letter
          index_d += 4
        end
      end
    end
    decrypted_message.join
  end

end
