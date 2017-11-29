# require 'station'
# require 'oystercard'
require 'journey'

describe Journey do
  let(:entry_station){double :station}
  let(:exit_station){double :station}

  it "is start" do
    expect(subject.start(entry_station)).to eq(entry_station)
  end
  it "is complete" do
    expect(subject.complete(exit_station)).to eq(exit_station)
  end
  it "calculate fare" do
    subject.complete("bal")
    expect(subject.calculate_fare).to eq(6)
  end
end
