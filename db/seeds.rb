# Очищаем базу
Post.destroy_all
Category.destroy_all
Subscription.destroy_all
User.destroy_all

# Создаем пользователя (только для админки)
User.create!(email: 'admin@example.com', password: 'password123')

# Создаем категории для Fail Forward
business = Category.create!(name: 'Бизнес-неудачи')
career = Category.create!(name: 'Карьерные ошибки')
creative = Category.create!(name: 'Творческие провалы')
science = Category.create!(name: 'Научные эксперименты')

# Создаем посты (БЕЗ user!)
Post.create!(
  title: 'Как я потерял 2 миллиона в стартапе', 
  content: 'История о том что я ошибся в расчетах...', 
  category: business
)

Post.create!(
  title: 'Уволили с работы мечты', 
  content: 'Но это открыло новые возможности...', 
  category: career
)

Post.create!(
  title: 'Провальная художественная выставка', 
  content: 'Никто не пришел, но я многому научился...', 
  category: creative
)

# Создаем подписки
Subscription.create!(email: 'reader1@example.com')
Subscription.create!(email: 'reader2@example.com')

puts "✅ Данные созданы:"
puts "- #{Post.count} постов"
puts "- #{Category.count} категорий"
puts "- #{Subscription.count} подписок" 
puts "- #{User.count} пользователей"
