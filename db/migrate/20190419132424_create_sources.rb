class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :address_url
      t.integer :news_count, default: 0

      t.timestamps
    end
  end
end
