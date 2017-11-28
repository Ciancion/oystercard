class Oystercard

  attr_accessor :balance, :state, :entry_station
    CARD_LIMIT = 90
    MIN_BALANCE = 1

  def initialize
    @balance = 0
    @state = "complete"
    @entry_station = nil
  end

  def top_up(money)
    raise("The maximum balance has been reached") if @balance + money > CARD_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
   raise("The card does not have enought money") if @balance < MIN_BALANCE
   @entry_station = entry_station
   in_journey?
  end

  def touch_out
    money = 5
    deduct(money)
    @entry_station = nil
    in_journey?
  end

  def in_journey?
    @entry_station != nil ? "in use" : "complete"
  end

  private
  def deduct(money)
    @balance -= money
  end

end
