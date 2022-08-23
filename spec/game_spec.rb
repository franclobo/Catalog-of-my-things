require_relative '../game'

describe Game do
  descrive 'move_to_archive' do
    it 'should be archived' do
      game = Game.new(true, '01/01/2000', '01/01/2000')
      game.move_to_archive
      expect(game.archived).to be true
    end

    it 'should not be archived if last_played_at is older than 2 years' do
      game = Game.new(true, '01/01/2020', '01/01/2000')
      game.move_to_archive
      expect(game.archived).to be false
    end
  end
end
