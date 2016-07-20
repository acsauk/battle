require_relative "player"

class Game
  attr_reader :attack, :first_player, :second_player

  def initialize(first_player = Player.new, second_player = Player.new)
    @first_player = first_player
    @second_player = second_player
  end

  def attack(player)
    player.receive_damage
  end
end
