class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    set_current_post
  end

  def new
  end

  def create
    @post = params[:post]
    @post.save
    redirect_to index
  end

  def edit
    set_current_post
  end

  def update
    @post = params[:post]
    if @post.save
      redirect_to index
    else #flash notice "Post couldn't be deleted"
      render edit
    end
  end

  def delete
  end

  private
  def set_current_post
    @post = params[:post]
  end
end
