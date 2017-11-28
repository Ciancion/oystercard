require 'oystercard'

describe Oystercard do
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

  it "deduct money" do
    subject.top_up(20)
    expect{subject.deduct(1)}.to change{subject.balance}.by -1
  end

  it "in journey defaults" do
    expect(subject.in_journey?).to be(false)
  end

 it "touch in changes journey to true" do
   subject.top_up(5)
   expect(subject.touch_in).to eq("in use")
 end

  it "touch out change journey to false" do
    expect(subject.touch_out).to eq("complete")
  end

  it "check min balance" do
  expect{subject.touch_in}.to raise_error("The card does not have enought money")
  end

end
