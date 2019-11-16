boolean = false

str_b = boolean.to_s
int_b = boolean ? 1 : 0 

puts "Boolean #{boolean}\nsize: 1"
puts "#{int_b}\nsize: #{int_b.size}"
puts "#{str_b}\nsize: #{str_b.bytesize}"
