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

  def test_it_can_square_today_date
    offset = Offset.new
    number = offset.today.to_i
    assert_equal true, offset.date_squared == (number * number).to_s
  end

end
