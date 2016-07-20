class Player
  attr_reader :player
  attr_accessor :hp

  def initialize(player)
    @player = player
    @hp = 60
  end

  def name
    player
  end

  def attack
    self.hp -= 10
  end

end
