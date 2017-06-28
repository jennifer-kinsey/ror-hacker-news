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

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = "Your link has been ...updated"
      redirect_to link_path(@link)
    else
      render :edit
    end
  end

  def destroy
    Link.find(params[:id]).destroy
    flash[:notice] = "Your link has been DESTROYED!"
    redirect_to root_path
  end

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Your link has been SAVED"
      redirect_to links_path
    else
      render :new
    end
  end

private
  def link_params
    params.require(:link).permit(:description, :link_url, :user)
  end


  def sorted_links
    links = Link.all
    links.sort { |x,y| y.rank <=> x.rank }
  end
end
