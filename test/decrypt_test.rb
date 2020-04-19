require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/decrypt"
require "./lib/shift"
require "pry"
require "Date"

class DecryptTest < Minitest::Test

  def test_it_exists
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_instance_of Decrypt, decrypt
  end

  def test_it_has_attributes
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal "hello world", decrypt.text
    assert_equal "02715", decrypt.key
    assert_equal "040895", decrypt.date
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], decrypt.alphabet
  end

  def test_it_can_randomize_key
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal true, decrypt.key.length == 5
  end

  def test_it_can_get_keys
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15], decrypt.keys
  end

  def test_it_can_get_randomized_keys
    decrypt = Decrypt.new("Hello World")
    assert_equal 4, decrypt.keys.length
    assert_instance_of Array, decrypt.keys
  end

  def test_it_can_get_offsets
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal [1, 0, 2, 5], decrypt.offsets
  end

  def test_date_squared
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal "1672401025", decrypt.date_squared
  end

  def test_today_squared
    decrypt = Decrypt.new("Hello World")
    number = decrypt.today.to_i
    assert_equal true, decrypt.date_squared == (number * number).to_s
  end

  def test_it_can_get_last_four_digits
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal "1025", decrypt.last_four("040895")
  end

  def test_it_can_get_today_date
    decrypt = Decrypt.new("Hello World")
    decrypt.stubs(:today).returns("180420")
    assert_equal "180420", decrypt.today
  end

  def test_it_can_get_shifts
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal [3, 27, 73, 20], decrypt.get_shifts
  end

  def test_it_can_make_negative_shift_hash
    decrypt = Decrypt.new("keder ohulw", "02715", "040895")
    assert_equal ({ :a => -3, :b => -27, :c => -73, :d => -20}), decrypt.neg_shifts_pairs
  end

  def test_it_can_generate_hash_with_starting_indexes_for_decrypt_method
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal ({ :a => 0, :b => 1, :c => 2, :d => 3}), decrypt.indexes
  end

  def test_it_can_decrypt_text
    decrypt = Decrypt.new("keder ohulw", "02715", "040895")
    decrypt.decrypt_message
    assert_equal "hello world", decrypt.decrypted_message
  end

  def test_it_can_create_hash_of_alphabet_with_index
    decrypt = Decrypt.new("Hello World", "02715", "040895")
    assert_equal ({"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6,"h"=>7,"i"=>8,"j"=>9,"k"=>10,"l"=>11,"m"=>12,"n"=>13,"o"=>14,"p"=>15,"q"=>16,"r"=>17,"s"=>18,"t"=>19,"u"=>20,"v"=>21,"w"=>22,"x"=>23,"y"=>24,"z"=>25," "=>26}), decrypt.alphabet_index
  end

  # def test_it_can_reverse
  # end
end
