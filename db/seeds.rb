admin = User.find_or_create_by!(email: "admin@example.com") { |u| u.password = "admin123"; u.role = :admin }

cat = Category.find_or_create_by!(name: "Истории") { |c| c.slug = "stories" }
post = Post.find_or_create_by!(title: "Первый пост", user: admin, category: cat) do |p|
  p.slug = "pervyj-post"
  p.body = "Текст поста..."
  p.status = :published
  p.published_at = Time.current
end
Attachment.find_or_create_by!(post: post, file_url: "/uploads/example.jpg") { |a| a.kind = :image }

puts "Seeds OK: admin=#{admin.email}, post=#{post.slug}, category=#{cat.slug}"
