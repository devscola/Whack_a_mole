class Score
  def initialize
    @amount = 0
  end
  
  def annotate
    @amount+=1  
  end

  def to_s
    @amount.to_s
  end
end