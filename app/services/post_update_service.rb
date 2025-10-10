class PostUpdateService
  def initialize(post, post_params)
    @post = post
    @post_params = post_params
  end
  
  def call
    @post.update(@post_params)
    @post
  end
end
