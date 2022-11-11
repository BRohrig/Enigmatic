require 'date'

class Shift 
  attr_reader :alphabet, 
              :key,
              :date

  def initialize(date = Date.today)
    @alphabet = ("a".."z").to_a << " "
    @key = ""
    @date = date
  end

  def new_key
    @key = 5.times.map{rand(10)}.join.to_s
  end
end