class MoveInput
  def initialize(move_string)
    @move_string = move_string
  end

  def prompt_for_move
    loop do
      puts 'Enter your move using algebraic notation:'
      move_string = STDIN.gets.chomp
      return move_string if valid?(move_string)

      puts 'Invalid move format.\n'
    end
  end

  def valid?(input_string)
    return false unless (2..6).include?(input_string.length)

    case input_string.length
    when 2
      return true if input_string.match?(/[a-h][1-8]/)
    when 3
      return true if input_string.match?(/[NBRQK][a-h][1-8]|0-0|x[a-h][1-8]/)
    when 4
      return true if input_string.match?(/[NBRQK][a-h1-8][a-h][1-8]|[a-h]x[a-h][1-8]|[a-h][1-8]=[NBRQK]/)
    when 5
      return true if input_string.match?(/[NBRQK][a-h][1-8][a-h][1-8]|0-0-0/)
    when 6
      return true if input_string.match?(/[NBRQK][a-h][1-8]x[a-h][1-8]|[a-h]x[a-h][1-8]=[NBRQK]/)
    end

    false
  end

  def convert_file_to_x(file)
    if ('a'..'h').include?(file)
      file.ord - 97
    else
      puts 'Invalid file'
    end
  end

  def convert_rank_to_y(rank)
    if rank.between?(1, 8)
      8 - rank
    else
      puts 'Invalid rank'
    end
  end
end