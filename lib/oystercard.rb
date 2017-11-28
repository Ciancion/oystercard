class Oystercard

  attr_accessor :balance, :state
    CARD_LIMIT = 90
    MIN_BALANCE = 1
  def initialize
    @balance = 0
    @state = "complete"
  end

  def top_up(money)
    raise("The maximum balance has been reached") if @balance + money > CARD_LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
   raise("The card does not have enought money") if @balance < MIN_BALANCE
   self.state = "in use"
  end

  def touch_out
    self.state = "complete"
  end

  def in_journey?
    state == "in use"
  end


end
