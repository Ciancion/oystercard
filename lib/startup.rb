require './lib/oystercard.rb'

oyster = Oystercard.new
oyster.top_up(20)
oyster.touch_in("algate")
oyster.touch_out("balham")

p oyster.journey_history

oyster.touch_in("algate")
oyster.touch_out("hackney")
p oyster.journey_history
