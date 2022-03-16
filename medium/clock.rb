class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def initialize(hours, minutes=0)
    @total_minutes = (hours * MINUTES_PER_HOUR) + minutes
  end

  def to_s
    hours, minutes = total_minutes.divmod(MINUTES_PER_HOUR)
    format('%02d:%02d', hours, minutes)
  end

  def +(minutes)
    @total_minutes = (minutes + total_minutes) % MINUTES_PER_DAY
    self
  end

  def -(minutes)
    self.+(minutes * -1)
  end

  def ==(other_clock)
    total_minutes == other_clock.total_minutes
  end

  protected

  attr_reader :total_minutes
end
