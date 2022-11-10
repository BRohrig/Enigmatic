require './lib/shift'
require './lib/enigma'

RSpec.describe Shift do
  let(:shift) {Shift.new}

  it 'is a shift' do
    expect(shift).to be_a(Shift)
  end

end