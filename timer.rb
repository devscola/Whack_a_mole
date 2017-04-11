class Timer
  MIN_RATE_APPEARANCE = 10


  def initialize()
    @last_appearance = 0
    @ticks = 0
    tick()
  end
  
  def tick
    @ticks+=1
  end

  def min_rate_reached?
    (@ticks - @last_appearance) == MIN_RATE_APPEARANCE
  end
  
end