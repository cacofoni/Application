class RoomsController < ApplicationController
  
  def show
    @comments = Comment.order(:created_at => 'desc')
  end
end
