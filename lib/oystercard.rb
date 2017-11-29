class Oystercard

  attr_reader :journey
  attr_accessor :balance, :state, :entry_station, :exit_station, :journey_history
    CARD_LIMIT = 90
    MIN_BALANCE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @state = false
    @entry_station = nil
    @journey = journey
    @journey_history = []
  end

  def top_up(money)
    raise("The maximum balance has been reached") if @balance + money > CARD_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    finish_deduct_journey(nil) if in_journey?
    start_journey(entry_station)
  end

  def start_journey(entry_station)
    raise("The card does not have enought money") if @balance < MIN_BALANCE
    @journey.start(entry_station)
  end
  def finish_deduct_journey(exit_station)
    journey.complete(exit_station)
    deduct(journey.calculate_fare)
    record_journey
  end

  def touch_out(exit_station)
    finish_deduct_journey(exit_station)
  end

  def in_journey?
    @entry_station != nil ? true : false
  end

  def record_journey
    @journey_history << journey
    journey = Journey.new
  end

  private
  def deduct(money)
    @balance -= money
  end

end
