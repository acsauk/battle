require_relative "player"

class Game
  attr_reader :attack, :first_player, :second_player, :current_player, :game_over

  def initialize(first_player = Player.new, second_player = Player.new)
    @first_player = first_player
    @second_player = second_player
    @current_player = first_player.name
    @game_over = false
  end

  def opponent
   if @current_player == first_player.name
     second_player
   else
     first_player
   end
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

  def loser
    if first_player.is_alive == false
      "#{first_player.name} loses the game :("
    elsif second_player.is_alive == false
      "#{second_player.name} loses the game :("
    else
      ""
    end
  end

  def game_over?
    if first_player.is_alive == false
      @game_over = true
    elsif second_player.is_alive == false
      @game_over = true
    else
      false
    end
  end
end
