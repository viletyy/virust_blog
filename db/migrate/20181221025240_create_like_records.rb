class CreateLikeRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :like_records do |t|
      t.string :type
      t.references :user
      t.string :ip_address
      t.references :subject, polymorphic: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
