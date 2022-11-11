class Rotation
  attr_reader :letters,
              :string

  def initialize(string)
    @string = string
    @letters = ("a".."z").to_a << " "
  end

end