class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_admin, only: [:new, :create]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    # Use of strong parameters instead of
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Your category was saved.'
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @title = 'edit'
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit!
  end

  def set_category
    @category = Category.find_by(slug: params[:id])
  end

end
