class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :desp
      t.text :content, limit: 4294967295
      t.references :category
      t.references :source
      t.integer :liked_counter, default: 0
      t.integer :viewed_counter, default: 0
      t.integer :comments_counter, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
