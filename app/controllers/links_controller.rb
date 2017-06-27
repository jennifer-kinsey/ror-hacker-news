class LinksController < ApplicationController

  def index
    @links = sorted_links
  end

  def up_vote
    link = Link.find(params[:id])
    link.rank += 1
    link.save
    redirect_to links_path
  end

  def down_vote
    link = Link.find(params[:id])
    link.rank -= 1
    link.save
    redirect_to links_path
  end

private

  def sorted_links
    links = Link.all
    links.sort { |x,y| y.rank <=> x.rank }
  end
end
