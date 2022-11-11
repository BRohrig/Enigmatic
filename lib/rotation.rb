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

  def spin(letter, shift)
    letters[(letters.find_index(letter) + shift) % 27]
  end

  def create_spin_slots
    { :one => spin_slots_1,
      :two => spin_slots_2,
      :three => spin_slots_3,
      :four => spin_slots_4}
  end

  def spin_slots_1
    num_array =* 0..string.length - 1
    num_array.select do |number|
      number == 0 || number % 4 == 0
    end
  end

  def spin_slots_2
    num_array =* 0..string.length - 1
    num_array.select do |number|
      number % 4 == 1
    end
  end

  def spin_slots_3
    num_array =* 0..string.length - 1
    num_array.select do |number|
      number % 4 == 2
    end
  end

  def spin_slots_4
    num_array =* 0..string.length - 1
    num_array.select do |number|
      number % 4 == 3
    end
  end

  def encrypt(shifts)
    string.each_char.with_index do |char, i|
      if create_spin_slots[:one].include?(i)
        string[i] = spin(char, shifts[:A])
      elsif create_spin_slots[:two].include?(i)
        string[i] = spin(char, shifts[:B])
      elsif create_spin_slots[:three].include?(i)
        string[i] = spin(char, shifts[:C])
      elsif create_spin_slots[:four].include?(i)
        string[i] = spin(char, shifts[:D])
      end
    end
  end

  

  

end