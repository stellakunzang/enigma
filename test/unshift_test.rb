require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/unshift"
require "mocha/minitest"
require "Date"

class UnshiftTest < Minitest::Test

  def test_it_exists
    unshift = Unshift.new("keder ohulw", "02715", "040895")
    assert_instance_of Unshift, unshift
  end

  def test_it_has_attributes
    unshift = Unshift.new("keder ohulw", "02715", "040895")
    assert_equal "keder ohulw", unshift.text
    assert_equal "02715", unshift.key
    assert_equal "040895", unshift.date
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], unshift.alphabet
  end
end