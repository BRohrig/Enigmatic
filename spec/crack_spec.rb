require './lib/crack'

RSpec.describe Crack do
  let(:crack) {Crack.new}
  it 'exists and is a subclass of enigma, and has the shift module loaded' do
    expect(crack).to be_a(Crack)
    expect(crack.class.superclass).to eq(Enigma)
    expect(crack.included_modules).to include(Shift)
  end

end