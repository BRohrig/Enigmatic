require_relative './rotation'
require_relative './shift'
require_relative './crack'

class Enigma
  include Shift, Crack

  attr_reader :date, :key, :new_message

  def encrypt(message, key = new_key, date = Date.today.to_s)
    { 
      :encryption => encrypt_message(message, key, date.to_s),
      :key        => key,
      :date       => Date.parse(date).strftime('%d%m%y')
    }
  end

  def encrypt_message(message, key = new_key, date = Date.today.to_s)
    @key = key
    @date = date.to_s
    Rotation.new(message).encrypt(find_shifts)
  end

  def decrypt(message, key = new_key, date = Date.today.to_s)
    { 
      :decryption => decrypt_message(message, key, date.to_s),
      :key        => key,
      :date       => Date.parse(date).strftime('%d%m%y')
    }
  end

  def decrypt_message(message, key = new_key, date = Date.today.to_s)
    @key = key
    @date = date.to_s
    Rotation.new(message).decrypt(find_shifts)
  end
end