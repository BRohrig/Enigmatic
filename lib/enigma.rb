require './rotation'
require './shift'


class Enigma
  attr_reader :message,
              :shift

  def initialize(input_hash)
    @message  = input_hash[:message]
    @shift    = Shift.new({:key => input_hash[:key], :date => input_hash[:date]}).find_shifts
  end

  def decrypt
    rotation = Rotation.new(@message)
    rotation.decrypt(@shift)
  end

end