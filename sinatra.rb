require 'sinatra'

before do
  @losing_moves = { :rock => :paper, :paper => :scissors, :scissors => :rock }
  @moves = @losing_moves.keys
end

get '/:moves' do
  computer_move = @moves.sample
  user_move = params[:moves].to_sym
  if user_move == computer_move
    output = "You drew with the computer."
  elsif user_move == @losing_moves[computer_move]
    output = "You beat the computer."
  else
    output = "You lost to the compter."
  end
  output + " User: #{user_move} Computer: #{computer_move}"
end
