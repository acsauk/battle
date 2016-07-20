class Player
  attr_reader :player
  def initialize(player)
    @player = player
  end
  def name
    player
  end
end
