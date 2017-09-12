class Board
  attr_accessor :cups

  def initialize(name1, name2)
  	@cups = Array.new(14) { [] }
  	place_stones
  	@name1 = name1
  	@name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,idx|
    	unless idx == 6 || idx == 13
    		(0...4).each do |i|
    			cup << :stone
    		end
    	end
    end
  end

  def valid_move?(start_pos)
 		if start_pos < 0 || start_pos > 12
 			raise "Invalid starting cup"
 		elsif @cups[start_pos].empty?
 			raise "Invalid starting cup"
 		end
  end

  def make_move(start_pos, current_player_name)
  	move_stones = @cups[start_pos]
  	@cups[start_pos] = []
  	idx = start_pos
  	until move_stones.length == 0
  		idx += 1
  		idx = 0 if idx > 13
  		if idx == 13 #can't have and current_player_name == @name1 here (corrected from solution)
  			@cups[idx] << move_stones.pop if current_player_name == @name2
  		elsif idx == 6 #can't have and current_player_name == @name1 here (corrected from solution)
  			@cups[idx] << move_stones.pop if current_player_name == @name1
  		else
  			@cups[idx] << move_stones.pop
  		end
  	end
  	render
  	next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
    	# :prompt call from solution 
    	:prompt
    elsif @cups[ending_cup_idx].length == 1
    	:switch
    else
    	ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  	if @cups.take(6).all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  		return true
  	end
  	return false
  end

  def winner
  	name1_score = @cups[6].length
  	name2_score = cups[13].length

  	if name1_score == name2_score
  		:draw
  	elsif name1_score > name2_score
  		@name1
  	else
  		@name2
  	end
  end
end
