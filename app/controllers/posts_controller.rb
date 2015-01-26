require 'pry'
class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) # Note the use the strong paramets instead of Post.new(params[post])
    if @post.save
      flash[:notice] = 'Your post was created.'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Your post was updated.'
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  # Strong parameters. This dictates which object attribute (the columns in your table in the database) is submittable by the client/browser, i.e. through a form submission or through direct coding into the address bar. This prevent hacking of your server.
  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
