# frozen_string_literal: true

require_relative './main'

print 'Введите ключ для шифровки: '
inp_key = gets.chomp

puts 'Введите строки:'
crypted_inp = []
tmp = gets.chomp
while tmp != ''
  crypted_inp.append(crypt(tmp, inp_key))
  tmp = gets.chomp
end

decrypted_inp = crypted_inp.map { |c| decrypt(c, inp_key) }

puts 'Зашифрованные строки:'
puts crypted_inp

puts 'Расшифрованные строки:'
puts decrypted_inp

