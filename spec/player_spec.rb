require 'player'

describe Player do
  subject(:player) { described_class.new(player_name) }
  let(:player_name) { double :player_name }

    it "returns it's name" do
      expect(player.name).to eq (player_name)
    end

    describe "#attack" do
      it "reduces the player HP by 10" do
        expect { player.attack }.to change{ player.hp }.by -10
      end
    end
end
