class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :type
      t.integer :user_id
      t.string :content
      t.string :subject_type
      t.integer :subject_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
