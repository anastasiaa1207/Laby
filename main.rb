# frozen_string_literal: true

# main.rb
def solve(eps, r)
  s = 0
  n = 4
  s1 = 0.5 * r**2 * n * Math.sin(2 * Math::PI / n)
  i = 0
  while s1 - s > eps
    s = s1
    n *= 2
    s1 = 0.5 * r**2 * n * Math.sin(2 * Math::PI / n)
    i += 1
  end
  [s1, i]
end
