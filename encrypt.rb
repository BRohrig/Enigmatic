require_relative './lib/cryptofile'

crypto = CryptoFile.new("encrypt")
crypto.write_it
puts "Created #{ARGV[1]} with the key #{crypto.enigma.key} and date #{crypto.enigma.date}"