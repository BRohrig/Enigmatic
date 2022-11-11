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
    rotation.encrypt(2,0,0,0)
    expect(rotation.string).to eq("k amba hcppybpurrle ouffkn bwnny")

    rotation.encrypt(0,4,0,0)
    expect(rotation.string).to eq("kdambe hctpybturrpe oyffkr bwrny")

    rotation.encrypt(0,0,1,0)
    expect(rotation.string).to eq("kdbmbeahctqybtvrrpf oygfkrabwroy")

    rotation.encrypt(0,0,0,28)
    expect(rotation.string).to eq("kdbnbeaictqzbtvsrpfaoyggkracwroz")
  end

end