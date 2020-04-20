require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/decryption"
require "./lib/shift"
require "pry"
require "Date"

class DecryptionTest < Minitest::Test

  def test_it_exists
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_instance_of Decryption, decrypt
  end

  def test_it_has_attributes
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal "hello world", decrypt.text
    assert_equal "02715", decrypt.key
    assert_equal "040895", decrypt.date
  end

  def test_it_has_alphabet
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], decrypt.alphabet
  end

  def test_it_can_randomize_key
    decrypt = Decryption.new("Hello World")
    assert_equal true, decrypt.key.length == 5
  end

  def test_it_can_get_keys
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15], decrypt.keys
  end

  def test_it_can_get_keys_from_randomized_key
    decrypt = Decryption.new("Hello World")
    assert_equal 4, decrypt.keys.length
    assert_instance_of Array, decrypt.keys
  end

  def test_date_squared
    decrypt = Decryption.new("Hello World","02715", "040895")
    assert_equal "1672401025", decrypt.date_squared
  end

  def test_it_can_get_today_date
    decrypt = Decryption.new("Hello World")
    assert_equal true, decrypt.today.length == 6
    assert_equal true, decrypt.today.class == String
  end

  def test_today_squared
    Date.stubs(:today).returns(Date.new(2020, 04, 18))
    decrypt = Decryption.new("Hello World")
    assert_equal "180420", decrypt.date
    assert_equal "32551376400", decrypt.date_squared
  end

  def test_it_can_get_last_four_digits
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal "1025", decrypt.last_four("040895")
  end

  def test_it_can_get_offsets
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal [1, 0, 2, 5], decrypt.offsets
  end

  def test_it_can_get_offsets_from_today
    decrypt = Decryption.new("Hello World")
    Date.stubs(:today).returns(Date.new(2020, 04, 18))
    assert_equal [6, 4, 0, 0], decrypt.offsets
  end

  def test_it_can_get_shifts
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal [3, 27, 73, 20], decrypt.get_shifts
  end

  def test_it_can_make_negative_shift_hash
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    assert_equal ({ :a => -3, :b => -27, :c => -73, :d => -20}), decrypt.neg_shifts_pairs
  end

  def test_it_can_generate_hash_with_starting_indexes_for_decrypt_method
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal ({ :a => 0, :b => 1, :c => 2, :d => 3}), decrypt.indexes
  end

  def test_it_can_decrypt_text
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    decrypt.decrypt_message
    assert_equal "hello world", decrypt.decrypted_message
  end

  def test_it_can_decrypt_text_with_punctuation
    decrypt = Decryption.new("keder ohulw!", "02715", "040895")
    decrypt.decrypt_message
    assert_equal "hello world!", decrypt.decrypted_message
  end

  def test_it_can_create_hash_of_alphabet_with_index
    decrypt = Decryption.new("Hello World", "02715", "040895")
    assert_equal ({"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6,"h"=>7,"i"=>8,"j"=>9,"k"=>10,"l"=>11,"m"=>12,"n"=>13,"o"=>14,"p"=>15,"q"=>16,"r"=>17,"s"=>18,"t"=>19,"u"=>20,"v"=>21,"w"=>22,"x"=>23,"y"=>24,"z"=>25," "=>26}), decrypt.alphabet_index
  end

  def test_it_can_reverse
    decrypt = Decryption.new("Hello World", "02715", "040895")
    decrypt.reverse("a", "f")
    assert_equal "c", decrypt.decrypted_message
    assert_equal ({:a => 4, :b => 1, :c => 2, :d => 3}), decrypt.indexes
  end

  def test_it_can_decrypt_letter
    decrypt = Decryption.new("Hello World", "02715", "040895")
    decrypt.decrypt_letter(0, "f")
    assert_equal "c", decrypt.decrypted_message
    assert_equal ({:a => 4, :b => 1, :c => 2, :d => 3}), decrypt.indexes
  end

  def test_it_can_decrypt_with_punctuation_between_letters
    decrypt = Decryption.new("keder,sprrdx!", "02715", "040895")
    decrypt.decrypt_message 
    assert_equal "hello, world!", decrypt.decrypted_message
  end

  def test_it_can_advance_symbol_index_with_punctuation
    decrypt = Decryption.new(".....", "02715", "040895")
    decrypt.decrypt_message
    assert_equal 8, decrypt.indexes[:a]
    assert_equal 5, decrypt.indexes[:b]
    assert_equal 6, decrypt.indexes[:c]
    assert_equal 7, decrypt.indexes[:d]
    assert_equal ".....", decrypt.decrypted_message
  end
end
