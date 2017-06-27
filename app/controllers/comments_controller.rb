class CommentsController < ApplicationController

  def index
    @link = Link.find(params[:link_id])
    @comments = @link.comments.all
  end

end
