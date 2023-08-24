require './lib/pieces/piece_movement/move_input'

describe MoveInput do
  let(:move_string) { described_class.new('h3') }

  describe 'valid?' do
    it 'returns false with an invalid string' do
      expect(move_string.valid?('hello')).to be false
    end
    it 'returns false with another invalid string' do
      expect(move_string.valid?('hh3')).to be false
    end
    it 'returns true when a pawn moves forward' do
      expect(move_string.valid?('h3')).to be true
    end
    it 'returns true when a bishop moves' do
      expect(move_string.valid?('Bg5')).to be true
    end
    it 'returns true when castling kingside' do
      expect(move_string.valid?('0-0')).to be true
    end
    it 'returns true when a pawn captures' do
      expect(move_string.valid?('xa7')).to be true
    end
    it 'returns true when a rank is given' do
      expect(move_string.valid?('Nab7')).to be true
    end
    it 'returns true when a file is given' do
      expect(move_string.valid?('R5c3')).to be true
    end
    it 'returns true when both a rank and file are given' do
      expect(move_string.valid?('Bc1e3')).to be true
    end
    it 'returns true when a pawn rank is given and captures' do
      expect(move_string.valid?('gxf6')).to be true
    end
    
  end

  describe 'convert_file_to_x' do
    it 'returns file as array index' do
      expect(move_string.convert_file_to_x('c')).to eq(2)
    end
    it 'returns file as array index' do
      expect(move_string.convert_file_to_x('a')).to eq(0)
    end
    it 'returns file as array index' do
      expect(move_string.convert_file_to_x('h')).to eq(7)
    end
  end

  describe 'convert_rank_to_y' do
    it 'returns rank as array index' do
      expect(move_string.convert_rank_to_y(1)).to eq(7)
    end
    it 'returns rank as array index' do
      expect(move_string.convert_rank_to_y(8)).to eq(0)
    end
    it 'returns rank as array index' do
      expect(move_string.convert_rank_to_y(4)).to eq(4)
    end
  end

  # describe 'prompt_for_move' do
  #   it 'returns the move when a pawn moves forward' do
  #     move_input = MoveInput.new
  #     allow(:prompt_for_move).to receive(:gets).and_return("b4\n")

  #     expect(move_input.prompt_for_move).to eq('b4')
  #   end
  # end

end