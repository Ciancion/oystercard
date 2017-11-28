require 'oystercard'

describe Oystercard do
  let(:entry_station) {double :station}

  it "check default balance" do
    expect(subject.balance).to eq(0)
  end

  it "add money" do
    expect{subject.top_up(5)}.to change{subject.balance}.from(0).to(5)
  end

  it "enforce max balance" do
    90.times{subject.top_up(1)}
    expect{ subject.top_up(1) }.to raise_error("The maximum balance has been reached")
  end

  # xit "deduct money" do
  #   subject.top_up(20)
  #   expect{subject.deduct(1)}.to change{subject.balance}.by -1
  # end

  it "in journey defaults" do
    expect(subject.in_journey?).to eq("complete")
  end

 it "touch in changes journey to true" do
   subject.top_up(5)
   expect(subject.touch_in(entry_station)).to eq("in use")
 end

  it "check min balance" do
  expect{subject.touch_in(entry_station)}.to raise_error("The card does not have enought money")
  end

  it "deduct correct amount of balance when touch out" do
    subject.top_up(10)
    expect{subject.touch_out}.to change{subject.balance}.by -5
  end

  it "remember entry station" do
    subject.top_up(12)
    subject.touch_in("aldgate")
    expect(subject.entry_station).to eq("aldgate")
  end

  it "forget entry station" do
    subject.top_up(12)
    subject.touch_in("aldgate")
    subject.touch_out
    expect(subject.entry_station).to eq(nil)
  end

  it "infer status in use" do
    subject.top_up(12)
    subject.touch_in("aldgate")
    expect(subject.in_journey?).to eq("in use")
  end

  it "infer status complete" do
    subject.top_up(12)
    subject.touch_in("aldgate")
    subject.touch_out
    expect(subject.in_journey?).to eq("complete")
  end


end
