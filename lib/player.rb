class Player
  HP = 60
  attr_reader :player
  attr_accessor :hp, :is_alive

  def initialize(player)
    @player = player
    @hp = HP
    @is_alive = true
  end

  def name
    player
  end

  def receive_damage
    self.hp -= 10
    @is_alive = false if self.hp <= 0
  end
end
