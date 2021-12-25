# frozen_string_literal: true

# main.rb
def solve(var_x)
  (((Math.sin((var_x**3 + var_x**2).abs))**3) / ((var_x**3 + var_x**2 - var_x)**2 + Math::PI))**0.5
end
