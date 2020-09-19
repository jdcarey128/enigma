require './lib/enigma'
enigma = Enigma.new(ARGV.first, ARGV.last).encrypt
puts "Created #{ARGV.last} with the key #{enigma[:key]} and date #{enigma[:date]}"
