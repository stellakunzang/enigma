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

  def test_it_can_generate_keys_from_number
    key = Key.new("02715")
    assert_equal 02, key.a
    assert_equal 27, key.b
    assert_equal 71, key.c
    assert_equal 15, key.d
  end

  def test_it_can_generate_keys_from_random_number
    key = Key.new
    key.stubs(:number).returns("02715")
    assert_equal 02, key.a
    assert_equal 27, key.b
    assert_equal 71, key.c
    assert_equal 15, key.d
  end

end
