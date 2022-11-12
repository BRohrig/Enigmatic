require_relative './lib/enigma'

message = File.open(ARGV[0], "r").read

enigma = Enigma.new

encrypted = enigma.encrypt_message(message)

File.open(ARGV[1], "w").write(encrypted)

puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.date}"