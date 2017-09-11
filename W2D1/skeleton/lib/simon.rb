class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    # display sequence 
    show_sequence
    # get user input
    require_sequence

    unless @game_over == true
      round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      # Added from solution
      sleep 0.75
      system("clear")
      sleep 0.75
    end
  end

  def require_sequence
    puts "Enter the first letter of each color from the seqeunce"
    @seq.each do |color|
      input_color = gets.chomp
      if color[0] != gets.chomp
        @game_over = true
        break
      end
    end
  end

  

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    "Successful round."
  end

  def game_over_message
    puts "#{@sequence_length - 1} rounds."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end




