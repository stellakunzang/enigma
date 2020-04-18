require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/enigma"
require "./lib/shift"
require "Date"
require "./lib/defaultable"
require "mocha/minitest"

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt
    enigma = Enigma.new
    assert_equal ({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }),
      enigma.encrypt("Hello World", "02715", "040895")
  end

  def test_it_can_encrypt_without_key_and_date
    enigma = Enigma.new
    assert_instance_of Hash, enigma.encrypt("Hello World")
    assert_equal 3, enigma.encrypt("Hello World").length
  end

  def test_it_can_decrypt
  skip
  enigma = Enigma.new
  assert_equal ({
    decryption: "hello world",
    key: "02715",
    date: "040895"
    }), enigma.decrypt("keder ohulw", "02715", "040895")
  end

end
