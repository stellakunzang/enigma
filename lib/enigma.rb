require_relative "defaultable"
require_relative "shift"
require_relative "unshift"
require "Date"

class Enigma

  include Defaultable

  attr_reader :encrypt_message, :encrypt_key, :encrypt_date, :decrypt_message, :decrypt_key, :decrypt_date

  def initialize
    @encrypt_message = nil
    @encrypt_key = nil
    @encrypt_date = nil
    @decrypt_message = nil
    @decrypt_key = nil
    @decrypt_date = nil
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
    create_unshift(text, key, date)
    data = Hash.new
    data[:decryption] = @decrypt_message
    data[:key] = @decrypt_key
    data[:date] = @decrypt_date
    return data
  end

  def create_unshift(text, key, date)
    unshift = Unshift.new(text, key, date)
    @decrypt_message = unshift.decrypt_message
    @decrypt_key = unshift.key
    @decrypt_date = unshift.date
  end

end
