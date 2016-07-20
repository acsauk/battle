
class Game
  attr_reader :attack
  def attack(player)
    player.receive_damage
  end
end
