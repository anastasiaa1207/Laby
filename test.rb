# frozen_string_literal: true

require './main'
require 'minitest/autorun'
# test.rb
# TestExec is responsible for checking the right calculation of method scale
class TestExec < Minitest::Test
  def test_1
    res = scale(b: 10) { |x| x * Math.sin(x) }
    assert_in_delta(12, res, 1)
  end

  def test_2
    func = ->(x) { Math.tan(x) }
    res = scale(b: 10, lambd: func)
    assert_in_delta(6, res, 1)
  end
end
