# frozen_string_literal: true

def get_formatted_key(inp, key)
  delta = inp.count(' ')
  result = key * ((inp.size - delta) / key.size + 1)
  result[0, inp.size - delta]
end

def crypt(inp, key)
  formatted_key = get_formatted_key(inp, key)
  i = 0
  j = 0
  res = inp.dup
  while i < res.size
    unless res[i] == ' '
      new_ord = res[i].ord + formatted_key[j].to_i
      new_ord += 'a'.ord - 'z'.ord - 1 if new_ord.chr.downcase > 'z'
      j += 1
      res[i] = new_ord.chr
    end
    i += 1
  end
  res
end

def decrypt(inp, key)
  formatted_key = get_formatted_key(inp, key)
  i = 0
  j = 0
  res = inp.dup
  while i < res.size
    unless res[i] == ' '
      new_ord = res[i].ord - formatted_key[j].to_i
      new_ord += 'z'.ord - 'a'.ord + 1 if new_ord.chr.downcase < 'a'
      j += 1
      res[i] = new_ord.chr
    end
    i += 1
  end
  res
end
