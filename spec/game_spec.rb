require 'game'

describe Game do
  subject(:game) { described_class.new(first_player, second_player) }
  let(:first_player) { double :player }
  let(:second_player) { double :player }

  before :each do
    allow(first_player).to receive(:name) { "Alex" }
    allow(second_player).to receive(:name) { "Ben" }
  end

  describe '#attack' do
    it "reduces the player's hp" do
      expect(second_player).to receive(:receive_damage)
      game.attack(second_player)
    end
  end

  describe '#attack' do
    it "reduces the player's hp" do
      expect(first_player).to receive(:receive_damage)
      game.attack(first_player)
    end
  end

  describe '#switch_player' do
    it "switches the player" do
      game.switch_player
      expect(game.current_player).to eq second_player.name
    end
  end

  describe "#loser" do
    it "returns the name of the loser" do
      allow(first_player).to receive(:is_alive).and_return(false)

      expect(game.loser).to eq "#{first_player.name} loses the game :("
    end

    it "returns the correct name" do
      allow(first_player).to receive(:is_alive).and_return(true)
      allow(second_player).to receive(:is_alive).and_return(false)

      expect(game.loser).to eq "#{second_player.name} loses the game :("
    end
  end
end
