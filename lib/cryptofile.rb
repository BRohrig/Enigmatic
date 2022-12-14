require_relative './enigma'

class CryptoFile
  attr_reader :enigma
  
  def initialize(argument)
    @argument = argument
    @enigma = Enigma.new
  end

  def read_it
    File.open(ARGV[0], "r").read
  end

  def encrypt_it
    enigma.encrypt_message(read_it)
  end

  def decrypt_it
    enigma.decrypt_message(read_it, ARGV[2], ARGV[3] = Date.today)
  end

  def crack_it
    enigma.cli_crack(read_it, ARGV[3] = Date.today)
  end

  def write_it
    if @argument == "decrypt"
      File.open(ARGV[1], "w").write(decrypt_it)
    elsif @argument == "encrypt"
      File.open(ARGV[1], "w").write(encrypt_it) 
    elsif @argument == "crack"
      File.open(ARGV[1], "w").write(crack_it)
    end
  end
end