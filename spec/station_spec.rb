require 'station'

describe Station do

  subject(:station) {described_class.new("Angel", 2)}

  it 'knows the station name' do
    expect(station.name).to eq("Angel")
  end

  it 'knows the station zone' do
    expect(station.zone).to eq(2)
  end

end
