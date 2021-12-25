# frozen_string_literal: true

def area(n, r)
  0.5 * r**2 * n * Math.sin(2 * Math::PI / n)
end

def solve(eps:, rad:)
  enum = Enumerator.new do |y|
    n = 4
    s1 = area(n, rad)
    loop do
      s = s1
      n *= 2
      s1 = area(n, rad)
      y << [s, s1]
    end
  end
  area_array = enum.take_while { |x| x[1] - x[0] > eps }
  [area_array[-1][1], area_array.length+1]
end
