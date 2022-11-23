# frozen_string_literal: true

# Create a game of tic tac toe
class TicTacToeBoard
  def initialize
    @board = Array.new(3) { Array.new(3) }
    @turn = 'X'
  end

  MOVES = {
    tl: [0, 0],
    tc: [0, 1],
    tr: [0, 2],
    cl: [1, 0],
    cc: [1, 1],
    cr: [1, 2],
    bl: [2, 0],
    bc: [2, 1],
    br: [2, 2]
  }.freeze

  def update_board(row, col)
    if !@board[row][col].nil?
      puts('Invalid move')
    else
      @board[row][col] = @turn
      @turn = @turn == 'O' ? 'X' : 'O'
    end
  end

  def move(pos)
    pos = pos.downcase
    if !%w[tl tr tc cl cr cc bl br bc].include? pos
      puts('I do not recognize that move')
    else
      row, col = MOVES[pos.to_sym]
      update_board(row, col)
    end
    print_board
  end

  def print_row(row)
    printable_row = row.map { |space| space.nil? ? '_' : space }
    puts(printable_row.join(' '))
  end

  def print_board
    @board.each { |row| print_row(row) }
    puts
  end
end

def play_game
  game = TicTacToeBoard.new
  game.move('cat')
  game.move('tl')
  game.move('bl')
end

play_game
