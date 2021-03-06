require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/enigma"
require "./lib/encryption"
require "./lib/decryption"
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
    assert_equal String, enigma.message.class
    assert_equal 11, enigma.message.length
    assert_equal String, enigma.key.class
    assert_equal 5, enigma.key.length
    assert_equal String, enigma.date.class
    assert_equal 6, enigma.date.length
  end

  def test_it_can_encrypt_punctuation
    enigma = Enigma.new
    assert_equal ({
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
      }), enigma.encrypt("Hello World!", "02715", "040895")
  end

  def test_it_can_encrypt_with_punctuation_between_letters
    enigma = Enigma.new
    assert_equal ({
      encryption: " dy,hqrbt?",
      key: "80302",
      date: "040387"
      }), enigma.encrypt("sup, girl?", "80302", "040387")
  end

  def test_it_can_create_encryption
    enigma = Enigma.new
    enigma.create_encryption("hello world", "02715", "040895")
    assert_equal "keder ohulw", enigma.message
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    assert_equal ({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }), enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_decrypt_punctuation
    enigma = Enigma.new
    assert_equal ({
      decryption: "hello world!",
      key: "02715",
      date: "040895"
      }), enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_it_can_decrypt_with_punctuation_between_letters
    enigma = Enigma.new
    assert_equal ({
      decryption: "sup, girl?",
      key: "80302",
      date: "040387"
      }), enigma.decrypt(" dy,hqrbt?", "80302", "040387")
  end

  def test_it_can_create_decryption
    enigma = Enigma.new
    enigma.create_decryption("keder ohulw", "02715", "040895")
    assert_equal "hello world", enigma.message
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

end
