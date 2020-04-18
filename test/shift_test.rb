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
    shift = Shift.new
    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    shift = Shift.new("Hello World", "02715", "040895")
    assert_equal [02, 27, 71, 15],  shift.keys
    assert_equal [1, 0, 2, 5], shift.offsets
    assert_equal [3, 27, 73, 20], shift.shifts
  end

end
