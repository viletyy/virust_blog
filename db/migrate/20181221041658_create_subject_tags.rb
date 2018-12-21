class CreateSubjectTags < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_tags do |t|
      t.integer :tag_id
      t.string :subject_type
      t.integer :subject_id

      t.timestamps
    end
  end
end
