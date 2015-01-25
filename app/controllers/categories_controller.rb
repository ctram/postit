require 'pry'
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    # binding.pry
    # Use of strong parameters instead of
    # @category = Category.create(params[:category])
    @category = Category.create(category_params)
    redirect_to categories_path
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
