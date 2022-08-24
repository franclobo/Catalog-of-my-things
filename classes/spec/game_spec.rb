require_relative '../game'

describe Game do
  context 'When create a game' do
    before(:all) do
      @game = Game.new('Yes', 2019, 2010)
    end

    it 'an instance of Game should be created' do
      expect(@game).to be_a Game
    end

    it 'can be archived? if last played at > 2 years' do
      expect(@game.send(:can_be_archive?)).to be true
    end
  end
end
