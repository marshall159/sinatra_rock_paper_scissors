require 'sinatra'

before do
  content_type :txt
  @winning_moves = { rock: :paper, paper: :scissors, scissors: :rock }
  @moves = @winning_moves.keys
end

get '/:moves' do

  user_move = params[:moves].to_sym

  if !@moves.include?(user_move)
    halt 403, "You must throw one of the following: #{ @moves.map {|elem| elem.to_s} }"
  end

  computer_move = @moves.sample

  if user_move == computer_move
    output = "You drew with the computer."
  elsif user_move == @winning_moves[computer_move]
    output = "You beat the computer."
  else
    output = "You lost to the compter."
  end
  output + " User: #{user_move} Computer: #{computer_move}"
end
