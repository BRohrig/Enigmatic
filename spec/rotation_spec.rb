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
    expect(rotation.index_pos("a")).to eq(0)
    expect(rotation.index_pos("r")).to eq(17)
    expect(rotation.index_pos(" ")).to eq(26)
  end

  it 'can find a new letter in the letters array based on a desired shift' do
    expect(rotation.spin("r", 7)).to eq("y")
    expect(rotation.spin("z", 1)).to eq(" ")
    expect(rotation.spin("z", 10)).to eq("i")

  end

  it 'can create a list of positions to spin for each key' do
    expect(rotation.create_spin_slots).to eq({:one =>   [0,4,8,12,16,20,24,28],
                                              :two =>   [1,5,9,13,17,21,25,29],
                                              :three => [2,6,10,14,18,22,26,30],
                                              :four =>  [3,7,11,15,19,23,27,31]})
  end

  it 'can rotate the first, fifth, etc letters a specified number of spaces' do
    rotation.encrypt({:A => 2, :B=> 0, :C=> 0, :D => 0})
    expect(rotation.string).to eq("k amba hcppybpurrle ouffkn bwnny")

    rotation.encrypt({:A => 0, :B=> 4, :C=> 0, :D => 0})
    expect(rotation.string).to eq("kdambe hctpybturrpe oyffkr bwrny")

    rotation.encrypt({:A => 0, :B=> 0, :C=> 1, :D => 0})
    expect(rotation.string).to eq("kdbmbeahctqybtvrrpf oygfkrabwroy")

    rotation.encrypt({:A => 0, :B=> 0, :C=> 0, :D => 28})
    expect(rotation.string).to eq("kdbnbeaictqzbtvsrpfaoyggkracwroz")
  end

  it 'can take the shifts and make them negative for decryption' do
    shifty = {:A => 4, :B => 37, :C => 94, :D => 0}
    rotation.decrypt_shift(shifty)
    expect(shifty).to eq(:A => -4, :B => -37, :C => -94, :D => -0)
  end

  it 'can decrypt a message given the shifts' do
    rotation.encrypt({:A => 2, :B=> 4, :C=> 1, :D => 28})
    expect(rotation.string).to eq("kdbnbeaictqzbtvsrpfaoyggkracwroz")

    rotation.decrypt({:A => 2, :B=> 4, :C=> 1, :D => 28})
    expect(rotation.string).to eq("i am a happy purple muffin bunny")
  end

end