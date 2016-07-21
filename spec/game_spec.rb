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

  describe '#switch_player' do
    it "switches the player" do
      game.switch_player
      expect(game.current_player).to eq second_player.name
    end
  end
end
