require './lib/rotation'
require './lib/enigma'

RSpec.describe Rotation do
  let(:rotation) {Rotation.new}

  it 'exists and is an instance of itself' do
    expect(rotation).to be_a(Rotation)
  end

end