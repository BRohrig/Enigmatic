require './lib/enigma'

RSpec.describe Enigma do
  
  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message' do
    expect(enigma.encrypt("I am a happy purple muffin bunny", "12345", "11-Nov-2022")).to eq("bdphteocutdtttimiptvfyuabroxnrbt")
  end

  it 'can decrypt a message' do
    expect(enigma.decrypt("bdphteocutdtttimiptvfyuabroxnrbt", "12345", "11-Nov-2022")).to eq("i am a happy purple muffin bunny")
  end


end