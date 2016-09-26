class Tic_Tac_Toe

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @player_turn = ""
    @human_player_name_HVC = ""
    @human_player_marker_HVC = ""
    @computer_player_marker_HVC = ""
    @first_player_name_HVH = ""
    @second_player_name_HVH = ""
    @first_player_marker_HVH = ""
    @second_player_marker_HVH = ""
    @first_computer_marker_CVC = "X"
    @second_computer_marker_CVC = "O"
  end

## Board ##

  def reset_game
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @player_turn = ""
    @human_player_name_HVC = ""
    @human_player_marker_HVC = ""
    @computer_player_marker_HVC = ""
    @first_player_name_HVH = ""
    @second_player_name_HVH = ""
    @first_player_marker_HVH = ""
    @second_player_marker_HVH = ""
    @first_computer_marker_CVC = "X"
    @second_computer_marker_CVC = "O"
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

## Choose Game Type ##

  def choose_game
    puts "\n** Welcome to Tic-Tac-Toe! **"
    puts ""
    print_board
    puts""
    puts "<= Choose Your Players => \n 1. Human Vs. Computer \n 2. Human Vs. Human \n 3. Computer Vs. Computer"
    game_type = gets.chomp
    if game_type == "1"
      puts "\n* You Chose Human Vs. Computer *"
      human_name_HVC
    elsif game_type == "2"
      puts "\n* You Chose Human Vs. Human *"
      names_HVH
    elsif game_type == "3"
      puts "\n* You Chose Computer Vs. Computer *"
      game_computer_vs_computer
    else
      puts "\n* Invalid Choice.. *"
      choose_game
    end
  end


## Human Vs. Computer (Game Option 1) ##


# Human Name (Human Vs. Computer) #

  def human_name_HVC
    puts "\n<= Please Enter Your Name =>"
    name = gets.chomp.capitalize
    @human_player_name_HVC = name
    choose_xo_HVC
  end

# Choose X or O (Human Vs. Computer) #

  def choose_xo_HVC
    puts "\n<= #{@human_player_name_HVC}, Please Choose X or O =>"
    human_player_choice = gets.chomp.capitalize
    if human_player_choice == "X"
      @human_player_marker_HVC = "X"
      @computer_player_marker_HVC = "O"
      puts "\n* #{@human_player_name_HVC} Chose X, So Computer Will Play As O *"
      choose_first_player_HVC
    elsif human_player_choice == "O"
      @human_player_marker_HVC = "O"
      @computer_player_marker_HVC = "X"
      puts "\n* #{@human_player_name_HVC} Chose O, So Computer Will Play As X *"
      choose_first_player_HVC
    else 
      puts "\n* Invalid Choice.. *"
      choose_xo_HVC
    end
  end

# Choose First Player (Human Vs. Computer) #

  def choose_first_player_HVC
    puts "\n<= Who Will Go First? #{@human_player_name_HVC} or Computer? =>"
    first = gets.chomp.capitalize
    if first == "#{@human_player_name_HVC}"
      puts "\n* #{@human_player_name_HVC} Will Go First *"
      @player_turn = @human_player_name_HVC
      game_human_vs_computer
    elsif first == "Computer"
      puts "\n* Computer Will Go First *"
      @player_turn = "Computer"
      game_human_vs_computer
    else 
      puts "\n* Invalid Choice.. *"
      choose_first_player_HVC
    end
  end

# Human Vs. Computer (Game Methods) #

  def game_human_vs_computer
    puts""
    print_board
    puts""

    until win(@board) || tie(@board)
      if @player_turn == @human_player_name_HVC
        puts "<= #{@human_player_name_HVC}, Please Enter [0-8]: =>"
        choice = gets.chomp.to_i
        if @board.include?(choice.to_s)
          @board[choice] = @human_player_marker_HVC
          puts "* #{@human_player_name_HVC} Chose " + choice.to_s + " *"
          puts""
          print_board
          puts""
        else choice != @board
          puts "\n* Invalid Choice.. *"
        end
      else @player_turn == "Computer"
        computer_moves_HVC
      end
      switch_player_HVC
    end
    game_over
  end

  def switch_player_HVC
    if @player_turn == @human_player_name_HVC
      @player_turn = "Computer"
    elsif @player_turn == "Computer"
      @player_turn = @human_player_name_HVC
    end
  end

  def computer_moves_HVC

    spot = nil
    
    until spot
      spot = @board.sample.to_i
      if @board[spot] != "X" && @board[spot] != "O"
        @board[spot] = @computer_player_marker_HVC
        puts "* Computer Chose " + spot.to_s + " *"
        puts""
        print_board
        puts""
      else
        spot = nil
      end
    end
  end


## Human Vs. Human (Game Option 2) ##


# Human Names (Human Vs. Human) #

  def names_HVH
    puts "\n<= Player 1, Enter Your Name =>"
    name_1 = gets.chomp.capitalize
    @first_player_name_HVH = name_1
    puts "\n<= Player 2, Enter Your Name =>"
    name_2 = gets.chomp.capitalize
    @second_player_name_HVH = name_2
    puts""
    choose_xo_HVH
  end

# Choose X or O (Human Vs. Human) #

  def choose_xo_HVH
    puts "<= #{@first_player_name_HVH}, Please Choose X or O =>"
    player_1_choice = gets.chomp.capitalize
    if player_1_choice == "X"
      @first_player_marker_HVH = "X"
      @second_player_marker_HVH = "O"
      puts "\n* #{@first_player_name_HVH} Chose X, So #{@second_player_name_HVH} Will Play As O *"
      choose_first_player_HVH
    elsif player_1_choice == "O"
      @first_player_marker_HVH = "O" 
      @second_player_marker_HVH = "X"
      puts "\n* #{@first_player_name_HVH} Chose O, So #{@second_player_name_HVH} Will Play As X *"
      choose_first_player_HVH
    else 
      puts "\n* Invalid Choice.. *"
      puts ""
      choose_xo_HVH
    end
  end

# Choose First Player (Human Vs. Human) #

  def choose_first_player_HVH
    puts "\n<= Who Will Go First? #{@first_player_name_HVH} or #{@second_player_name_HVH}? =>"
    first = gets.chomp.capitalize
    if first == "#{@first_player_name_HVH}"
      puts "\n* #{@first_player_name_HVH} Will Go First *"
      @player_turn = @first_player_name_HVH
      game_human_vs_human
    elsif first == "#{@second_player_name_HVH}"
      puts "\n* #{@second_player_name_HVH} Will Go First *"
      @player_turn = @second_player_name_HVH
      game_human_vs_human
    else
      puts "\n* Invalid Choice.. *"
      choose_first_player_HVH
    end
  end

# Human Vs. Human (Game Methods) #

  def game_human_vs_human
    puts""
    print_board
    puts""
  
    until win(@board) || tie(@board)
      puts "<= #{@player_turn}, Please Enter [0-8]: =>"
      choice_1 = gets.chomp.to_i
      if @board.include?(choice_1.to_s)
        @board[choice_1] = get_player_marker_HVH
        puts "* #{@player_turn} Chose " + choice_1.to_s + " *"
        puts""
        print_board
        puts""
        switch_player_HVH
      else
        puts "\n* Invalid Choice.. *"
      end
    end
    game_over
  end

  def get_player_marker_HVH
    if @player_turn == @first_player_name_HVH
      @first_player_marker_HVH
    elsif @player_turn == @second_player_name_HVH
      @second_player_marker_HVH
    end
  end

  def switch_player_HVH
    if @player_turn == @first_player_name_HVH
      @player_turn = @second_player_name_HVH
    elsif @player_turn == @second_player_name_HVH
      @player_turn = @first_player_name_HVH
    end
  end


## Computer Vs. Computer (Game Option 3) ##

  def game_computer_vs_computer
    puts""
    print_board
    puts""

    @player_turn = "Computer 1"
      
    until win(@board) || tie(@board)
      spot = nil
      
      until spot
        spot = @board.sample.to_i
        if @board[spot] != "X" && @board[spot] != "O"
          @board[spot] = get_player_marker_CVC
          puts "* #{@player_turn} Chose " + spot.to_s + " *"
          puts""
          print_board
          puts""
          switch_player_CVC
        elsif
          spot == nil
        end
      end
    end
    game_over
  end

  def get_player_marker_CVC
    if @player_turn == "Computer 1"
      @first_computer_marker_CVC
    elsif @player_turn == "Computer 2"
      @second_computer_marker_CVC
    end
  end

  def switch_player_CVC
    if @player_turn == "Computer 1"
      @player_turn = "Computer 2"
    elsif @player_turn == "Computer 2"
      @player_turn = "Computer 1"
    end
  end

## Win/Tie? ##

  def win(b)

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

## Game Over ##

  def game_over
    puts "** Game Over **"
    puts ""
    puts "<= Would You Like To Play Again? =>"
    answer = gets.chomp.capitalize
    if answer == "Yes"
      reset_game
      choose_game
    elsif answer == "No"
      puts ""
      puts "** Thanks For Playing Tic-Tac-Toe! Goodbye! **"
      puts ""
    else
      puts "* Invalid Choice.. *"
      puts ""
      game_over
    end
  end

end

## End ##

game = Tic_Tac_Toe.new
game.choose_game