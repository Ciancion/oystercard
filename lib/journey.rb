class Journey
 attr_accessor :entry_station, :exit_station

  def start(entry_station)
    self.entry_station = entry_station
  end

  def complete(exit_station)
    self.exit_station = exit_station
  end

  def calculate_fare
     entry_station && exit_station ? 1 : 6
  end



end
