require_relative './rotation'
require_relative './shift'

class Enigma
  include Shift
  attr_reader :date, :key, :new_message

  def encrypt(message, key = new_key, date = Date.today.to_s)
    @key = key 
    @date = date.to_s
    new_message = encrypt_message(message, @key, @date)
    "{ 
      encryption: => #{new_message},
      key:        => #{key},
      date:       => #{Date.parse(date).strftime('%d%m%y')}
    }"
  end

  def encrypt_message(message, key = new_key, date = Date.today.to_s)
    @key = key
    @date = date.to_s
    Rotation.new(message).encrypt(find_shifts)
  end

  def decrypt(message, key = new_key, date = Date.today.to_s)
    @key = key
    @date = date.to_s
    new_message = decrypt_message(message, @key, @date)
    "{ 
      decryption: => #{new_message},
      key:        => #{key},
      date:       => #{Date.parse(date).strftime('%d%m%y')}
    }"
  end

  def decrypt_message(message, key = new_key, date = Date.today.to_s)
    @key = key
    @date = date.to_s
    Rotation.new(message).decrypt(find_shifts)
  end
end