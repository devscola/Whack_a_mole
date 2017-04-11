require './hole'
require './mole'

class Field
  SIZE = 6

  def initialize()
    @the_mole = Mole.new
    @holes = Array.new(SIZE,Hole.new)
  end

  def force_appearance
    @holes[random_hole] = @the_mole
  end
  
  def without_moles?
    true
  end

  def mole_in_the_hole?(hole)
    @holes[hole-1].is_a? Mole
  end

  def show
    @holes.join
  end
  private 

  def random_hole
    rand(1..SIZE)    
  end
end