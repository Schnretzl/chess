class Player
  def initialize(color)
    @color = color
    @name = prompt_for_name(color)
  end

  def prompt_for_name(color)
    player_number = color == 'white' ? 1 : 2
    loop do
      puts "Enter player #{player_number} name:"
      name = STDIN.gets.chomp
      return name if name =~ /\A[\p{Letter}\p{Mark}]+\z/

      puts 'Invalid name entered, please enter only letters.'
    end
  end
end