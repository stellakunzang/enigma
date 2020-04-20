require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/shift"
require "pry"
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
  end

  def test_date_squared
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal "1672401025", shift.date_squared
  end

  def test_it_can_get_last_four_digits
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal "1025", shift.last_four("040895")
  end

  def test_it_can_get_offsets
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [1, 0, 2, 5], shift.offsets
  end

  def test_it_can_get_keys
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15], shift.keys
  end

  def test_it_can_get_shifts
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [3, 27, 73, 20], shift.get_shifts
  end

  def test_it_can_store_shifts
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [3, 27, 73, 20], shift.shifts
  end

  def test_it_can_advance_symbol_index
    shift = Shift.new("Hello World", "02715", "040895")
    shift.advance_symbol_index(0)
    assert_equal 4, shift.indexes[:a]
  end

end
