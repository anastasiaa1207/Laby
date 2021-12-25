# frozen_string_literal: true

require_relative './main'
require 'minitest/autorun'

# Main test
class TestMain < Minitest::Test
  def setup
    @key = '123'
    @input = (0..3).map { (0...8).map { rand('a'.ord..'z'.ord).chr }.join }.join(' ')
  end

  def test_crypt
    @result = decrypt(crypt(@input, @key), @key)
    assert_equal(@result, @input)
  end
end
