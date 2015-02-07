require 'pry'
class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit, :update]
  before_action :require_user, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comments = Comment.all
    @categories = Category.all
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def create
    # binding.pry
    @post = Post.new(post_params) # Note the use the strong paramets instead of Post.new(params[post])
    @post.user = current_user
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
    params.require(:post).permit(:title, :url, :user_id, :description, category_ids: []) # note the virtual attribute 'category_ids' is written here like a hash key/value pair!
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
