require 'oystercard'
require 'journey'

describe Oystercard do
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey) {double :journey}
  before do
    subject.top_up(20)
  end

  it "check default balance" do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

  it "add money" do
    card = Oystercard.new
    expect{card.top_up(5)}.to change{card.balance}.from(0).to(5)
  end

  it "enforce max balance" do
    card = Oystercard.new
    90.times{card.top_up(1)}
    expect{ card.top_up(1) }.to raise_error("The maximum balance has been reached")
  end

  it "in journey defaults" do
    expect(subject.in_journey?).to eq(false)
  end

  it "check min balance" do
  card = Oystercard.new
  expect{card.touch_in(entry_station)}.to raise_error("The card does not have enought money")
  end

  it "deduct correct amount of balance when touch out" do
    expect{subject.touch_out(exit_station)}.to change{subject.balance}.by -6
  end

  it "remember entry station" do
    subject.touch_in("aldgate")
    expect(subject.journey.entry_station).to eq("aldgate")
  end

  it "forget entry station" do
    subject.touch_in("aldgate")
    subject.touch_out(exit_station)
    expect(subject.entry_station).to eq(nil)
  end

  it "infer status false" do
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.in_journey?).to eq(false)
  end

  it "remember exit station" do
    subject.touch_out("balham")
    expect(subject.journey.exit_station).to eq("balham")
  end

  it "save journey" do
    expect(subject.journey_history).to be_a_kind_of(Array)
  end

  it "check empty list of journey" do
    expect(subject.journey_history).to be_empty
  end

  it "check that touching in and touching out creates one journey" do
    subject.touch_in("aldgate")
    subject.touch_out("balham")
    expect(subject.journey_history[0].entry_station).to eq("aldgate")
  end
  it "check touch in station different to nil" do
    expect(subject.touch_in(entry_station)).to_not eq(nil)
  end

  it "check if record journey" do
    expect(subject.record_journey).to_not eq(nil)
  end

end
