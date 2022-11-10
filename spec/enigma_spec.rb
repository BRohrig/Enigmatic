require './lib/enigma'

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}
  let(:letters) {("a".."z").to_a << " "}

  it 'exists and has an alphabet attribute that contains all the letters and a space' do
    expect(enigma).to be_a(Enigma)
    expect(enigma.alphabet).to eq(letters)
  end


end