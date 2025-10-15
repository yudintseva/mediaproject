class MakeProfilesUserIdUnique < ActiveRecord::Migration[7.2]
  def change
    # 1) удалим неуникальный индекс, если он есть
    if index_exists?(:profiles, :user_id)
      # В SQLite имя индекса нам не нужно, можно удалять по колонке
      remove_index :profiles, column: :user_id
    end

    # 2) добавим уникальный индекс
    add_index :profiles, :user_id, unique: true unless index_exists?(:profiles, :user_id, unique: true)
  end
end

