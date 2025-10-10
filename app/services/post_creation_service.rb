class PostCreationService
  def initialize(post_params)
    @post_params = post_params
  end
  
  def call
    post = Post.new(@post_params)
    post.save
    post
  end
end
