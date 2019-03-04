class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.string :desp
      t.text :content, limit: 4294967295
      t.integer :liked_counter, default: 0
      t.integer :viewed_counter, default: 0
      t.integer :comments_counter, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
