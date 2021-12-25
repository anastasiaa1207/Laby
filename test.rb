# frozen_string_literal: true

require './main'
require 'minitest/autorun'
# test.rb
# TestExec is responsible for checking the right calculation of method solve
class TestExec < Minitest::Test
  # check for right method execution
  def test_zero
    x = 0
    result = 0.0
    assert_in_delta(result, solve(x), 10**-3)
  end

  def test_minus1
    x = -1
    result = 0.0
    assert_in_delta(result, solve(x), 10**-3)
  end

  def test_minus5
    x = -5
    result = 0.0+0.0037922517750714865i
    assert_in_delta(result, solve(x), 10**-3)
  end

  def test_ninty
    x = 90
    result = 6.791149133926649e-07
    assert_in_delta(result, solve(x), 10**-3)
  end
end
