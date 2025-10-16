class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @posts    = @category.posts.includes(:user).order(created_at: :desc)
  end
end
