class PostsController < ApplicationController
  def index
  @posts = Post.includes(:category, :user).order(created_at: :desc)

  end

  def show
   @post = Post.includes(comments: :user).find(params[:id])

  end
end
