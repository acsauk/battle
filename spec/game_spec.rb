require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:first_player) { double :player }
  let(:second_player) { double :player }

  describe '#attack' do
    it "reduces the player's hp" do
      expect(second_player).to receive(:receive_damage)
      game.attack(second_player)
    end
  end
end
