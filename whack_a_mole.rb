require './field'
require './score'
require './timer'

class WhackAMole
  
  
  def initialize()
    @field = Field.new 
    @score = Score.new
    @timer = Timer.new
  end
  
  def tick
    @timer.tick
    ensure_rate
  end

  def whack(hole)
    @score.annotate if mole_in_the_hole?(hole)
  end

  def show
    @field.show
  end

  def score
    @score.to_s
  end
  

  private 

  def ensure_rate
    return unless (no_moles? && rate_reached?)
    @field.force_appearance 
  end

  def no_moles?
    @field.without_moles?
  end

  def rate_reached?
    @timer.min_rate_reached?
  end

  def mole_in_the_hole?(hole)
    @field.mole_in_the_hole?(hole)
  end
end