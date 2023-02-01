class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

# ~~~~~~~~~~~~~~~~START HELPER METHODS~~~~~~~~~~~~~~~~

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, player_token)
        @board[index] = player_token
    end

    def position_taken?(index)
        @board[index] != " "
        # @board[index] == " " ? false : true

        # if @board[index] != " "
        #     return false
        # else return true
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
        # index >= 0 && index <= 8
    end

    def turn_count
        @board.count { |position| position != " " }
        # @board.count {|position| position != position_taken?(index)}
    end

    def current_player
        # (turn_count) % 2 ? "X" : "O"
        turn_count.even? ? "X" : "O"
    end

    def turn
        # 1. Ask the user for their move by specifying a position between 1-9.
        puts "Please enter a number 1-9 to mark your position:"
        # 2 & 3. Receive the user's input and Translate that input into an index value. // takes the gets (input) and passes it to input_to_index and sets it to new variable
        user_input = input_to_index(gets) 
        # 4. If the move is valid, make the move and display the board.
        if valid_move?(user_input)
            move(user_input, current_player)
            display_board
        else 
            turn
    end
end

# ~~~~~~~~~~~~~~~~END HELPER METHODS~~~~~~~~~~~~~~~~
    def won?
        WIN_COMBINATIONS.detect do |combination| 
            if @board[combination[0]] == @board[combination[1]] && 
                @board[combination[1]] == @board[combination[2]] && 
                position_taken?(combination[0])
                return combination
            end
        end
    end

    def full?
        @board.all? {|index| index != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || full?
    end

    def winner
        # if combination = won?
        #     @board[combination[0]] end
        won? ? @board[won?[0]] : nil
    end

    def play
        turn until over? || draw?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end

# play = TicTacToe.new