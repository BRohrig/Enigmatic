require_relative './enigma'
require_relative './shift'


class Crack < Enigma
  include Shift

  attr_reader :date

  def initialize(message, date = Date.today)
    @message  = message
    @date     = date.to_s
    @letters  = ("a".."z").to_a << " "
  end

  def reverse_offsets
   {:a => -(create_offset[0].to_i),
    :b => -(create_offset[1].to_i),
    :c => -(create_offset[2].to_i),
    :d => -(create_offset[3].to_i)}
  end

  def find_last_four
    @message[-4..-1]
  end

  def index_pos(letter)
    @letters.find_index(letter)
  end

  def find_last_indexes
    find_last_four.each_char.map do |char|
      index_pos(char)
    end
  end

  

end