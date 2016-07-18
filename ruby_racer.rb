class RubyRacer
  attr_reader :players, :die, :length

  def initialize(players, die, length = 30)
    @players = players # [:a,:b]
    @die = die
    @length = length
    @player_pos = Array.new(players.length) {0} # [0,0]
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
    # Return true if one of the players has reached the finish line
    # Returns false if no one has reached the finish line

  def finished?
    @player_pos.max >= @length
  end

  # Returns the winner if there is one, +nil+ otherwise
    # Winner is the player that finished first

  def winner
    furthest_player if finished?
  end


def furthest_player
  players.max_by do |player|
    @player_pos[players.index(player)]
  end
end

  # Rolls the die and advances +player+ accordingly
    # Find the index of the player from the players array
    # Find the same index of the player on the player position array.
    # Increase the value at the index of the player position array but the value of the dice roll.

  def advance_player(player)
    index = @players.index(player)
    @player_pos[index] +=  @die.roll
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.

  def board_visualization
    players.each_with_index do |player, index|
      row = '|' * length
      player_position = [@player_pos[index], length].min
      row[player_position] = player.to_s
      puts row
    end

    nil

    # row_0 = "|" * length
    # row_1 = "|" * length
    # row_2 = "|" * length
    # row_1[[@player_pos[0],@length].min] = @players[0].to_s
    # row_2[[@player_pos[1],@length].min] = @players[1].to_s
    # row_3[[@player_pos[2],@length].min] = @players[2].to_s
    # puts row_1
    # puts row_2
    # puts row_3
  end
end

# Think about storing play position in a hash.
