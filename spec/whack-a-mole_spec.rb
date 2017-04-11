require './whack_a_mole'
require 'rspec'

describe "Whack-a-Mole" do
  before(:each) do
    @game= WhackAMole.new
  end

  it "shows 6 holes" do
    expected="______"
    expect(@game.show()).to eq expected
  end

  describe "Moles appears randomly " do
    it "at least one emerges every 10 ticks" do
      game_play=play_for(10)
      expect(game_play.include?('x')).to be true
    end
  end

  describe "whacking a hole" do
    it "gives 1 point if a mole has been whacked" do
      current_game = play_until_mole
      hole_number = position_the_mole(current_game)
      @game.whack(hole_number)
      expect(@game.score).to eq '1'
    end

    it "gives 0 point if no mole has been whacked" do
      any_hole = 2
      current_game = play_until_no_mole
      @game.whack(any_hole)
      expect(@game.score).to eq '0'
    end

  end

  def play_for (ticks)
    game_play=''
    1..ticks.times do
      @game.tick()
      game_play << @game.show()
    end
    game_play
  end


  def play_until_mole 
    until @game.show.include?('x') do
      @game.tick()
    end
    @game.show
  end

  def play_until_no_mole 
    until !@game.show.include?('x') do
      @game.tick()
    end
    @game.show
  end

  def position_the_mole(game_play)
    game_play.index('x')+1
  end
end
