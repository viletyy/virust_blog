class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :source
      t.datetime :begin_time
      t.integer :hours, default: 24

      t.timestamps
    end
  end
end
