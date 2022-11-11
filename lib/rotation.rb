class Rotation
  attr_reader :letters,
              :string

  def initialize(string)
    @string = string.downcase
    @letters = ("a".."z").to_a << " "
  end

  def index_pos(letter)
    letters.find_index(letter)
  end

  def create_spin_slots
    { :one => spin_slots_1,
      :two => spin_slots_2,
      :three => spin_slots_3,
      :four => spin_slots_4}
  end

  def spin_slots_1
    num_array =* 1..string.length
    num_array.select do |number|
      number == 1 || number % 4 == 1
    end
  end

  def spin_slots_2
    num_array =* 1..string.length
    num_array.select do |number|
      number % 4 == 2
    end
  end

  def spin_slots_3
    num_array =* 1..string.length
    num_array.select do |number|
      number % 4 == 3
    end
  end

  def spin_slots_4
    num_array =* 1..string.length
    num_array.select do |number|
      number % 4 == 0
    end
  end

  def first_spin(shift)
    string.each.with_index
  end

end