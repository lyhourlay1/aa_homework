require 'set'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    arr = Array.new(14)
    @cups= arr.map.with_index do |ele,i| 
      if i!=6 && i!=13
        [:stone, :stone, :stone, :stone]
      else
        []
      end
    end
    @name1= name1
    @name2=name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos >13 || start_pos <0
      raise 'Invalid starting cup'
    end
    if @cups[0].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    # next_pos=start_pos
    # until @cups[next_pos].empty?
      length =@cups[start_pos].length
      @cups[start_pos]=[]
      i=start_pos
      length.times do 
        i+=1
        i +=1 if i==13 && current_player_name == @name1
        i +=1  if i==6 && current_player_name == @name2
        i = i%14
        @cups[i]+=[:stone]
      end
    
    render
    next_turn(i)  
    #   next_pos= i+1
    # end
      
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx== 13 || ending_cup_idx==6
    return :switch if @cups[ending_cup_idx].count==1 
    
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|ele| ele.empty?}
    return true if @cups[7..12].all? {|ele| ele.empty?}
    false
  end

  def winner
    
      if @cups[6].count> @cups[13].count
        return @name1
      elsif @cups[6].count< @cups[13].count
        return @name2
      else
        return :draw
      end
    
  end
end
