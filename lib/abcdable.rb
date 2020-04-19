module Abcdable

  def alphabet
    ("a".."z").to_a << " "
  end

  def alphabet_index
    alphabet_with_index = {}
    alphabet.to_enum.with_index do |letter, index|
      alphabet_with_index[letter] = index
    end
    alphabet_with_index
  end

  def shifts_pairs
    letters = [:a, :b, :c, :d]
    Hash[letters.zip(get_shifts)]
  end

  def set_indexes
    letters = [:a, :b, :c, :d]
    starting_indexes = [0, 1, 2, 3]
    Hash[letters.zip(starting_indexes)]
  end

end
