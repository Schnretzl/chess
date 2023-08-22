class MoveInput
  def initialize(input_string)
    @move_string = prompt_for_move
  end

  def prompt_for_move
    puts 'Enter your move:'
    move_string = STDIN.gets.chomp
    if is_valid?(move_string)
      #done
    else
      #get new move
    end
  end

  def is_valid?(input_string)
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
    if (a..h).include?(file)
      97 - file.ord
    else
      puts 'Invalid file'
    end
  end

  def convert_rank_to_y(rank)
    if rank.between?(1, 7)
      8 - rank
    else
      puts 'Invalid rank'
    end
  end
end