require './lib/board'

describe Board do
  subject(:game_board) { described_class.new }

  describe '#empty?' do
    it 'returns true when the square is empty' do
      expect(game_board.empty?(2, 2)).to be true
    end

    it 'returns false when the square is not empty' do
      expect(game_board.empty?(0, 0)).to be false
    end
  end
end