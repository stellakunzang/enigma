require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/shift"
# require "./lib/key"
# require "./lib/offset"
require "mocha/minitest"
require "Date"

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new("Hello World", "02715", "040895")
    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal "hello world", shift.text
    assert_equal "02715", shift.key
    assert_equal "040895", shift.date
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], shift.alphabet
  end

  def test_it_can_randomize_key
    shift = Shift.new("Hello World")
    assert_equal true, shift.key.length  == 5
  end

  def test_it_can_get_keys
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15],  shift.keys
  end

  def test_it_can_get_randomized_keys
    shift = Shift.new("Hello World")
    assert_equal 4, shift.keys.length
    assert_instance_of Array, shift.keys
  end

  def test_it_can_get_offsets
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [1, 0, 2, 5], shift.offsets
  end

  def test_date_squared
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal "1672401025", shift.date_squared
  end

  def test_today_squared
    shift = Shift.new("Hello World")
    number = shift.today.to_i
    assert_equal true, shift.date_squared == (number * number).to_s
  end

  def test_it_can_get_last_four_digits
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal "1025", shift.last_four
  end

  def test_it_can_get_today_date
    shift = Shift.new("Hello World")
    shift.stubs(:today).returns("180420")
    assert_equal "180420", shift.today
  end

  def test_it_can_get_offsets_today
    shift = Shift.new("Hello World")
    # shift.stubs(:today).returns()
    assert_equal 4, shift.offsets.length
    assert_instance_of Array, shift.offsets
  end

  def test_it_can_get_shifts
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [3, 27, 73, 20], shift.shifts
  end

  def test_it_can_encrypt_text
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal "keder ohulw", shift.encrypt_message
  end

  def test_it_can_encrypt_text_with_punctuation
    shift = Shift.new("Hello World!", "02715", "040895")
    assert_equal "keder ohulw!", shift.encrypt_message
  end

  def test_it_can_create_hash_of_alphabet_with_index
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal ({"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6,"h"=>7,"i"=>8,"j"=>9,"k"=>10,"l"=>11,"m"=>12,"n"=>13,"o"=>14,"p"=>15,"q"=>16,"r"=>17,"s"=>18,"t"=>19,"u"=>20,"v"=>21,"w"=>22,"x"=>23,"y"=>24,"z"=>25," "=>26}), shift.alphabet_index
  end

end
