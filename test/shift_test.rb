require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/shift"
require "./lib/key"
require "./lib/offset"
require "mocha/minitest"

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new("Hello World", "02715", "040895")
    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal "Hello World", shift.text
    assert_equal "02715", shift.key
    assert_equal "040895", shift.date
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], shift.alphabet
  end

  def test_it_can_get_keys
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15],  shift.get_keys("02715")
  end

  def test_it_can_get_keys_nil_input
    shift = Shift.new("Hello World")
    key = nil
    assert_equal 4, shift.get_keys(key).length
    assert_instance_of Array, shift.get_keys(key)
  end

  def test_it_can_get_offsets
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [1, 0, 2, 5], shift.get_offsets("040895")
  end

  def test_it_can_get_offsets_nil_input
    shift = Shift.new("Hello World")
    date = nil
    assert_equal 4, shift.get_offsets(date).length
    assert_instance_of Array, shift.get_offsets(date)
  end

  def test_it_can_set_keys_offsets_instance_variables
    shift = Shift.new("Hello World", "02715", "040895")
    shift.get_keys("02715")
    shift.get_offsets("040895")
    assert_equal [02, 27, 71, 15], shift.keys
    assert_equal [1, 0, 2, 5], shift.offsets
  end

  def test_it_can_get_shifts
    shift = Shift.new("Hello World", "02715", "040895")
    shift.get_keys("02715")
    shift.get_offsets("040895")
    assert_equal [3, 27, 73, 20], shift.get_shifts
  end

  def test_it_can_encrypt_text
    shift = Shift.new("Hello World", "02715", "040895")
    shift.get_keys("02715")
    shift.get_offsets("040895")
    shift.get_shifts
    assert_equal "keder ohulw", shift.encrypt_message("Hello World")
  end

  def test_it_can_create_hash_of_alphabet_with_index
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal ({"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6,"h"=>7,"i"=>8,"j"=>9,"k"=>10,"l"=>11,"m"=>12,"n"=>13,"o"=>14,"p"=>15,"q"=>16,"r"=>17,"s"=>18,"t"=>19,"u"=>20,"v"=>21,"w"=>22,"x"=>23,"y"=>24,"z"=>25," "=>26}), shift.alphabet_index
  end

end
