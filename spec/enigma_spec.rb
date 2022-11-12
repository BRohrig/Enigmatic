require './lib/enigma'

RSpec.describe Enigma do
  
  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message' do
    expect(enigma.encrypt("I am a happy purple muffin bunny", "12345", "11-Nov-2022")).to eq("{ \n      encryption: => bdphteocutdtttimiptvfyuabroxnrbt,\n      key:        => 12345,\n      date:       => 111122\n    }")
  end

  it 'can decrypt a message' do
    expect(enigma.decrypt("bdphteocutdtttimiptvfyuabroxnrbt", "12345", "11-Nov-2022")).to eq("{ \n      decryption: => i am a happy purple muffin bunny,\n      key:        => 12345,\n      date:       => 111122\n    }")
  end

  it 'can encrypt/decrypt a message with special characters' do
    expect(enigma.encrypt("I am a happy purple muffin bunny!", "12345", "11-Nov-2022")).to eq("{ \n      encryption: => bdphteocutdtttimiptvfyuabroxnrbt!,\n      key:        => 12345,\n      date:       => 111122\n    }")
    expect(enigma.decrypt("bdphteocutdtttimiptvfyuabroxnrbt!", "12345", "11-Nov-2022")).to eq("{ \n      decryption: => i am a happy purple muffin bunny!,\n      key:        => 12345,\n      date:       => 111122\n    }")
  end


end