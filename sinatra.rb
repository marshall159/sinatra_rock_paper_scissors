require 'sinatra'

before do
  @losing_moves = { :rock => :paper, :paper => :scissors, :scissors => :rock }
  @moves = @losing_moves.keys
end

get '/:moves' do
  "Your move was #{params[:moves]}"
end
