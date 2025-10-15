class AdjustPostsForNewSchema < ActiveRecord::Migration[7.2]
  def change
    # 1) автор поста
    add_reference :posts, :user, foreign_key: true unless column_exists?(:posts, :user_id)

    # 2) slug для ЧПУ
    add_column :posts, :slug, :string unless column_exists?(:posts, :slug)

    # 3) статус публикации и время публикации
    add_column :posts, :status, :integer, default: 0 unless column_exists?(:posts, :status)
    add_column :posts, :published_at, :datetime unless column_exists?(:posts, :published_at)

    # 4) body: если есть старое поле content — переименуем; иначе создадим body
    if column_exists?(:posts, :content) && !column_exists?(:posts, :body)
      rename_column :posts, :content, :body
    end
    add_column :posts, :body, :text unless column_exists?(:posts, :body)
  end
end
