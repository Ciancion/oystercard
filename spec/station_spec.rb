require 'station'

describe Station do
  it 'checks name' do
    station = Station.new(name: "balham", zone: 3)
  expect(station.name).to eq("balham")
  end
  it 'checks zone' do
    station = Station.new(name: "balham", zone: 3)
  expect(station.zone).to eq(3)
  end
end
