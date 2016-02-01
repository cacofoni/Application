class RoomsController < ApplicationController
  def show
    @comments = Comment.limit(1000).order(:created_at => 'desc')
  end
end
