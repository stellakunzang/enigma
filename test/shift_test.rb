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
  end

  def test_it_can_get_keys
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15],  shift.get_keys("02715")
  end

  def test_it_can_get_keys_no_input
    shift = Shift.new("Hello World")
    
  end

  def test_it_can_get_offsets
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [1, 0, 2, 5], shift.get_offsets("040895")
  end

  def test_it_can_get_offsets_no_input

  end

  def test_it_can_get_shifts
    assert_equal [3, 27, 73, 20], shift.shifts
  end

end
