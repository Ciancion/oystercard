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
    subject.complete("balham")
    expect(subject.calculate_fare).to eq(6)
  end
  it "knows if a journey is complete" do
    subject.start(entry_station)
    subject.complete(exit_station)
    expect(subject).to be_completed
  end
end
