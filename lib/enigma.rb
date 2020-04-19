require_relative "defaultable"
require_relative "shift"
require "Date"

class Enigma

  include Defaultable

  attr_reader :message, :key, :date

  def initialize
    @message = nil
    @key = nil
    @date = nil
  end

  def encrypt(text, key = randomize, date = today)
    create_shift(text, key, date)
    data = Hash.new
    data[:encryption] = @message
    data[:key] = @key
    data[:date] = @date
    data
  end

  def create_shift(text, key, date)
    shift = Shift.new(text, key, date)
    shift.encrypt_message
    @message = shift.encrypted_message
    @key = shift.key
    @date = shift.date
  end

  def decrypt(text, key, date = today)
    create_unshift(text, key, date)
    data = Hash.new
    data[:decryption] = @message
    data[:key] = @key
    data[:date] = @date
    return data
  end

  def create_unshift(text, key, date)
    shift = Shift.new(text, key, date)
    shift.decrypt_message
    @message = shift.encrypted_message
    @key = shift.key
    @date = shift.date
  end

end
