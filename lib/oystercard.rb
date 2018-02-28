class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :starting_station, :journeys

  def initialize
    @balance = 0
    @starting_station = nil
    @ending_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    starting_station != nil
  end

  def touch_in(station_1)
    fail 'Sorry, not enough money' if balance < MINIMUM_BALANCE
    @starting_station = station_1
  end

  def touch_out(ending_station)
    deduct(MINIMUM_BALANCE)
    @journeys << {from: starting_station, to: ending_station}
    @starting_station = @ending_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
