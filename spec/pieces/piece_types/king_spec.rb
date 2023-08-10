require './lib/pieces/piece_types/king'

describe King do
  let(:board) { instance_double('Board', grid: Array.new(8) { Array.new(8, ' ') }) }
  subject(:black_king) { described_class.new(0, 1, 'black', board) }
  subject(:white_king) { described_class.new(6, 2, 'white', board) }

  before do
    allow(board).to receive(:white_king_threatened_squares).and_return([[2, 1], [2, 0], [2, 2], [2, 3],
                                                                        [2, 4], [2, 5], [2, 6], [2, 7]])
    allow(board).to receive(:black_king_threatened_squares).and_return([[5, 1], [5, 0], [5, 2], [5, 3],
                                                                        [5, 4], [5, 5], [5, 6], [5, 7]])
    board.grid[7][0] = 'P'
    board.grid[7][1] = 'P'
    board.grid[7][2] = 'P'
    board.grid[7][3] = 'P'
    board.grid[7][4] = 'P'
    board.grid[7][5] = 'P'
    board.grid[7][6] = 'P'
    board.grid[7][7] = 'P'
    board.grid[0][0] = 'P'
    board.grid[0][2] = 'P'
    board.grid[1][0] = 'P'
    board.grid[1][1] = 'P'
    board.grid[1][2] = 'P'
    board.grid[1][3] = 'P'
    board.grid[1][4] = 'P'
    board.grid[1][5] = 'P'
    board.grid[1][6] = 'P'
    board.grid[1][7] = 'P'
  end

  describe '#set_squares_threatened' do
    it 'threatens no squares when completely surrounded' do
      black_king.set_squares_threatened(board)
      expect(black_king.squares_threatened).to be_empty
    end
    it 'threatens all empty surrounding squares' do
      white_king.set_squares_threatened(board)
      expect(white_king.squares_threatened).to contain_exactly([6, 1], [6, 3], [5, 1], [5, 2], [5, 3])
    end
  end

  describe '#set_valid_moves' do
    it 'has no moves when completely surrounded' do
      black_king.set_valid_moves(board)
      expect(black_king.instance_variable_get(:@valid_moves)).to be_empty
    end
    it 'can move to empty squares' do
      white_king.set_valid_moves(board)
      expect(white_king.instance_variable_get(:@valid_moves)).to contain_exactly([6, 1], [6, 3], [5, 1], [5, 2], [5, 3])
    end
    it 'can not move to empty threatened squares' do
      white_king.instance_variable_set(:@y_pos, 3)
      white_king.set_squares_threatened(board)
      white_king.set_valid_moves(board)
      expect(white_king.instance_variable_get(:@valid_moves)).to contain_exactly([3, 1], [3, 3], [4, 1], [4, 2], [4, 3])
    end
  end
end
