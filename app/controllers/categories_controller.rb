require 'pry'
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
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
    @category = Category.find(params[:id])
    @title = 'edit'
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit!
  end




end
