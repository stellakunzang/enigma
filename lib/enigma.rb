require_relative "defaultable"
require_relative "decryption"
require_relative "encryption"

class Enigma

  include Defaultable

  attr_reader :message,
              :key,
              :date

  def encrypt(text, key = randomize, date = today)
    create_encryption(text, key, date)
    data = Hash.new
    data[:encryption] = @message
    data[:key] = @key
    data[:date] = @date
    data
  end

  def create_encryption(text, key, date)
    encryption = Encryption.new(text, key, date)
    encryption.encrypt_message
    @message = encryption.encrypted_message
    @key = encryption.key
    @date = encryption.date
  end

  def decrypt(text, key, date = today)
    create_decryption(text, key, date)
    data = Hash.new
    data[:decryption] = @message
    data[:key] = @key
    data[:date] = @date
    return data
  end

  def create_decryption(text, key, date)
    decryption = Decryption.new(text, key, date)
    decryption.decrypt_message
    @message = decryption.decrypted_message
    @key = decryption.key
    @date = decryption.date
  end

end
