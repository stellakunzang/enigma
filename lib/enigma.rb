class Enigma

  def initialize
  end

  def encrypt(text, key = nil, date = nil)
    shift = Shift.new(text, key, date)
    data = Hash.new
    data[:encryption] = shift.encrypt_message
    data[:key] = shift.keys.join
    data[:date] = shift.offsets.join
    binding.pry
  end

  def decrypt(text, key, date = today)
    data = Hash.new
    data[:encryption] = unscrambled_text
    data[:key] = key
    data[:date] = date
    return data
  end

end
