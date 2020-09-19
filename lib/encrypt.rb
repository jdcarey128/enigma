require './lib/enigma'
message = File.open(ARGV.first).read
encryption = ARGV.last

puts message
