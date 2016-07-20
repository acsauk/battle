require 'player'

describe Player do
  subject(:player) { described_class.new(player_name) }
  let(:player_name) { double :player_name }

  describe '#name' do
    it "returns it's name" do
      expect(player.name).to eq (player_name)
    end
  end

  describe '#hp' do
    it 'returns the health-points' do
      expect(player.hp).to eq(described_class::HP)
    end
  end
  describe '#receive_damage' do
    it "it reduces the player's health-points" do
      expect{ player.receive_damage }.to change{ player.hp }.by -10
    end
  end
end
