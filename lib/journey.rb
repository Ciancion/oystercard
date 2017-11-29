class Journey
  attr_accessor :entry_station, :exit_station
  MIN_FARE = 1

  def start(entry_station)
    self.entry_station = entry_station
  end

  def complete(exit_station)
    self.exit_station = exit_station
  end

  def calculate_fare
    completed?  ? MIN_FARE : 6
  end

  def completed?
    entry_station && exit_station
  end


end
