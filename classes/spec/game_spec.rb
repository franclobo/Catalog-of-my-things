require_relative './classes/game'

describe Game do
  context 'When create a game' do
    it 'an instance of Game should be created' do
      game = Game.new('Multiplayer', '2019-01-01', '2019-01-01')
      expect(game).to be_a Game
    end

    it 'can be archived? if last played at > 2 years' do
      game = Game.new('Multiplayer', 2019, 2010)
      expect(game.can_be_archive?).to be true
    end
  end
end
