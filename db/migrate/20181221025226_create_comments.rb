class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :type
      t.references :user
      t.string :content
      t.references :subject, polymorphic: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
