filename = ARGV[0]
s_line = ARGV[1]

file = File.open(filename, 'r')

file.each.with_index do |line, i|
  if line.chomp == s_line
    p i + 1
    break
  end
end

file.close
