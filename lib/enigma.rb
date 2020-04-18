class Enigma

  def initialize
  end

  def encrypt(text, key = random, date = today)
    data = Hash.new
    data[:encryption] = scrambled_text
    data[:key] = key
    data[:date] = date
    return data
  end

  def decrypt(text, key, date = today)
    data = Hash.new
    data[:encryption] = unscrambled_text
    data[:key] = key
    data[:date] = date
    return data
  end

end
