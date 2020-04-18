require_relative "defaultable"

class Enigma

  include Defaultable

  def initialize
    @encrypt_message = nil
    @encrypt_key = nil
    @encrypt_date = nil
  end

  def encrypt(text, key = randomize, date = today)
    create_shift(text, key, date)
    data = Hash.new
    data[:encryption] = @encrypt_message
    data[:key] = @encrypt_key
    data[:date] = @encrypt_date
    data
  end

  def create_shift(text, key, date)
    shift = Shift.new(text, key, date)
    @encrypt_message = shift.encrypt_message
    @encrypt_key = shift.key
    @encrypt_date = shift.date
  end

  def decrypt(text, key, date = today)
    data = Hash.new
    data[:decryption] = shift.decrypt_message
    data[:key] = key
    data[:date] = date
    return data
  end

end
