require './lib/enigma'
enigma = Enigma.new(ARGV.first, ARGV[1], nil, ARGV[2]).decrypt
puts "Created #{ARGV[1]} with the key #{enigma[:key]} and date #{enigma[:date]}"
