require './lib/shift'
require './lib/enigma'

RSpec.describe Shift do
  let(:shift) {Shift.new}
  let(:letters) {("a".."z").to_a << " "}

  it 'is a shift and a subclass of enigma' do
    expect(shift).to be_a(Shift)
    expect(shift.superclass).to be_a(Enigma)
    expect(shift.alphabet).to eq(letters)
  end

end