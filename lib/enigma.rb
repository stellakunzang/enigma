require_relative "defaultable"
require_relative "shift"
require_relative "unshift"
require "Date"

class Enigma

  include Defaultable

  attr_reader :message, :key, :date

  # :encrypt_message, :encrypt_key, :encrypt_date, :decrypt_message, :decrypt_key, :decrypt_date

  def initialize
    @message = nil
    @key = nil
    @date = nil
    # @decrypt_message = nil
    # @decrypt_key = nil
    # @decrypt_date = nil
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
    @message = shift.encrypt_message
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
    unshift = Unshift.new(text, key, date)
    @message = unshift.decrypt_message
    @key = unshift.key
    @date = unshift.date
  end

end
