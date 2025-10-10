class PostDecorator
  def initialize(post)
    @post = post
  end
  
  def truncated_content(length = 200)
    @post.content.truncate(length)
  end
  
  def formatted_created_at
    @post.created_at.strftime("%d.%m.%Y")
  end
  
  def category_badge
    "<span class='category'>📁 #{@post.category.name}</span>".html_safe
  end
end
