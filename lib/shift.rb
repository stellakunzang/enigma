require_relative "defaultable"
require_relative "abcdable"

class Shift

  include Defaultable
  include Abcdable

  attr_reader :text, :key, :date, :date_squared, :last_four, :shifts, :indexes

  def initialize(text, key = randomize, date = today)
    @text = text.downcase
    @key ||= key.to_s
    @date = date
    @date_squared ||= square_date(date).to_s
    @last_four = @date_squared[-4..-1]
    @alphabet = alphabet
    @alphabet_index ||= alphabet_index
    @shifts = get_shifts
    @indexes = set_indexes
  end

  def encrypt_message
    alphabet_a = alphabet.rotate(shifts_pairs[:a])
    alphabet_b = alphabet.rotate(shifts_pairs[:b])
    alphabet_c = alphabet.rotate(shifts_pairs[:c])
    alphabet_d = alphabet.rotate(shifts_pairs[:d])

    encrypted_message = []

    raw_text = @text.split("").to_enum
    raw_text.with_index do |letter, index|
      if !alphabet.include?(letter)
        encrypted_message << letter
      else
        if index == @indexes[:a]
          new_letter = alphabet_a[@alphabet_index[letter]]
          encrypted_message << new_letter
          @indexes[:a] += 4
        elsif index == @indexes[:b]
          new_letter = alphabet_b[@alphabet_index[letter]]
          encrypted_message << new_letter
          @indexes[:b] += 4
        elsif index == @indexes[:c]
          new_letter = alphabet_c[@alphabet_index[letter]]
          encrypted_message << new_letter
          @indexes[:c] += 4
        elsif index == @indexes[:d]
          new_letter = alphabet_d[@alphabet_index[letter]]
          encrypted_message << new_letter
          @indexes[:d] += 4
        end
      end
    end
    encrypted_message.join
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
