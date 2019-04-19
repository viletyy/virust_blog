class CreateSubjectTags < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_tags do |t|
      t.integer :tag_id
      t.references :subject, polymorphic: true

      t.timestamps
    end
  end
end
