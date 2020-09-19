require './lib/enigma'
enigma = Enigma.new(ARGV.first, ARGV[1], ARGV[2], ARGV.last).decrypt
puts "Created #{ARGV[1]} with the key #{enigma[:key]} and date #{enigma[:date]}"
