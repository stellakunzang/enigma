require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/key"
require "mocha/minitest"

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_it_can_take_an_argument
    key = Key.new(14825)
    assert_equal "14825", key.number
  end

  def test_it_can_randomize
    key = Key.new
    num = key.randomize
    assert_equal true, num.length  == 5
  end
end
