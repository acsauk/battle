require_relative "player"

class Game
  attr_reader :attack, :first_player, :second_player, :current_player

  def initialize(first_player = Player.new, second_player = Player.new)
    @first_player = first_player
    @second_player = second_player
    @current_player = first_player.name
  end

  def attack(player)
    player.receive_damage
  end

  def switch_player
    if @current_player == first_player.name
      @current_player = second_player.name
    else
      @current_player = first_player.name
    end
  end
end
