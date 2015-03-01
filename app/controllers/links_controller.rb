class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def create
    @link = Link.new({:user_id => current_user.id, :slug => params[:slug], :target_url => params[:target_url]})
    
    @link.standardize_target_url!
    request.remote_ip

    if @link.save
      flash[:success] = "New link added"
      redirect_to links_path
    else
      flash[:error] = "Fill out the form"
      render "new"
    end
  end

  def new
    @link = Link.new
  end

  def show
    @link = Link.find_by(:id => params[:id])  
  end
end
