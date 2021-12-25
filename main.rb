# frozen_string_literal: true

def find_max(func)
  h = 2.0 / 1000
  max = func.call(-1)
  (0..999).each do |n|
    temp = func.call(-1 + n * h)
    max = temp > max ? temp : max
  end
  max
end

def scale(b:, lambd: nil, &block)
  func = block_given? ? block : lambd
  f_max = find_max func
  b / f_max
end
