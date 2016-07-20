class Player
  HP = 60
  attr_reader :player
  attr_accessor :hp

  def initialize(player)
    @player = player
    @hp = HP
  end

  def name
    player
  end

  def receive_damage
    self.hp -= 10
  end
end
