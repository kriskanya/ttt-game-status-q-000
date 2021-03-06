# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

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

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if ((board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || 
      (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"))
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.none? { |i| i == " " }
end

def draw?(board)
  return won?(board) == false && full?(board) ? true : false
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end