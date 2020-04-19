require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/encrypt"
require "./lib/shift"
require "pry"
require "Date"

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal "hello world", encrypt.text
    assert_equal "02715", encrypt.key
    assert_equal "040895", encrypt.date
  end

  def test_it_has_alphabet
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], encrypt.alphabet
  end

  def test_it_can_randomize_key
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal true, encrypt.key.length == 5
  end

  def test_it_can_get_keys
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15], encrypt.keys
  end

  def test_it_can_get_keys_from_randomized_
    encrypt = Encrypt.new("Hello World")
    assert_equal 4, encrypt.keys.length
    assert_instance_of Array, encrypt.keys
  end

  def test_date_squared
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal "1672401025", encrypt.date_squared
  end

  def test_it_can_get_today_date
    encrypt = Encrypt.new("Hello World")
    assert_equal true, encrypt.today.length == 6
    assert_equal true, encrypt.today.class == String
  end

  def test_today_squared
    Date.stubs(:today).returns(Date.new(2020, 04, 18))
    encrypt = Encrypt.new("Hello World")
    assert_equal "180420", encrypt.date
    assert_equal "32551376400", encrypt.date_squared
  end

  def test_it_can_get_last_four_digits
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal "1025", encrypt.last_four("040895")
  end

  def test_it_can_get_offsets
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal [1, 0, 2, 5], encrypt.offsets
  end

  def test_it_can_get_offsets_from_today
    encrypt = Encrypt.new("Hello World")
    Date.stubs(:today).returns(Date.new(2020, 04, 18))
    assert_equal [6, 4, 0, 0], encrypt.offsets
  end

  def test_it_can_get_shifts
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal [3, 27, 73, 20], encrypt.get_shifts
  end

  def test_it_can_make_hash_with_shifts
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal ({ :a => 3, :b => 27, :c => 73, :d => 20}), encrypt.shifts_pairs
  end

  def test_it_can_generate_hash_with_starting_indexes_for_encrypt_method
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal ({ :a => 0, :b => 1, :c => 2, :d => 3}), encrypt.indexes
  end

  def test_it_can_encrypt_text
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    encrypt.encrypt_message
    assert_equal "keder ohulw", encrypt.encrypted_message
  end

  def test_it_can_encrypt_text_with_punctuation
    encrypt = Encrypt.new("Hello World!", "02715", "040895")
    encrypt.encrypt_message
    assert_equal "keder ohulw!", encrypt.encrypted_message
  end

  def test_it_can_create_hash_of_alphabet_with_index
    encrypt = Encrypt.new("Hello World", "02715", "040895")
    assert_equal ({"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6,"h"=>7,"i"=>8,"j"=>9,"k"=>10,"l"=>11,"m"=>12,"n"=>13,"o"=>14,"p"=>15,"q"=>16,"r"=>17,"s"=>18,"t"=>19,"u"=>20,"v"=>21,"w"=>22,"x"=>23,"y"=>24,"z"=>25," "=>26}), encrypt.alphabet_index
  end

  # def test_it_can_turn
  # end

end
