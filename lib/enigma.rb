require './rotation'
require './shift'


class Enigma
  def encrypt(message, key, date)
    shift = Shift.new({:key => key, :date => date})
    new_message = Rotation.new(message).encrypt(shift.find_shifts)
    "{ 
      encryption: => #{new_message},
      key:        => #{key},
      date:       => #{Date.parse(shift.date).strftime('%d%m%y')}
    }"
  end

  def decrypt(message, key, date)
    shift = Shift.new({:key => key, :date => date})
    new_message = Rotation.new(message).decrypt(shift.find_shifts)
    "{ 
      decryption: => #{new_message},
      key:        => #{key},
      date:       => #{Date.parse(shift.date).strftime('%d%m%y')}
    }"
  end
end