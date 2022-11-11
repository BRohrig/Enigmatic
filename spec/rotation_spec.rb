require './lib/rotation'
require './lib/enigma'

RSpec.describe Rotation do
  let(:rotation) {Rotation.new("I am a happy purple muffin bunny")}
  let(:letters) {("a".."z").to_a << " "}

  it 'exists and is an instance of itself and has letters and input string' do
    expect(rotation).to be_a(Rotation)
    expect(rotation.letters).to eq(letters)
  end

  it 'can tell the array index position of each letter' do
    expect(rotation.letters.index_pos("a")).to eq(0)
    expect(rotation.letters.index_pos("r")).to eq(17)
    expect(rotation.letters.index_pos(" ")).to eq(26)
  end

  xit 'can rotate the first, fifth, etc letters a specified number of spaces' do
    expect(rotation.first_spin).to eq("")
  end

end