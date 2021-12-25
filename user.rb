# frozen_string_literal: true

require_relative 'main'

result = scale(b: 10) { |x| x * Math.sin(x) }
puts "M for f(x) = x*sin(x) equals #{result}"

func = lambda { |x| Math.tan(x) }
result = scale(b: 10, &func)
puts "M for f(x) = tg(x) equals #{result}"
