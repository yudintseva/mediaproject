class PagesController < ApplicationController
  def home
    @posts = Post.recent.limit(3)
    @categories = Category.all
  end

  def about
  end
end
