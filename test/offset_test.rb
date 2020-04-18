require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/offset"
require "Date"

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new
    assert_instance_of Offset, offset
  end

  def test_it_has_attributes
    offset = Offset.new("040895")
    assert_equal "1672401025", offset.date_squared
  end

  def test_it_has_today
    offset = Offset.new
    assert_equal true, offset.today.length == 6
  end

end
