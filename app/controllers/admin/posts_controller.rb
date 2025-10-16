class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.recent
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    service = PostCreationService.new(post_params)
    @post = service.call
    
    if @post.persisted?
      redirect_to admin_posts_path, notice: '✅ Пост успешно создан!'
    else
      render :new
    end
  end

  def update
    service = PostUpdateService.new(@post, post_params)
    
    if service.call
      redirect_to admin_posts_path, notice: '✅ Пост успешно обновлен!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: '✅ Пост успешно удален!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
