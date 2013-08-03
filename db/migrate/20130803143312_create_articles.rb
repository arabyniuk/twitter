class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :text
      t.text :content

      t.timestamps
    end
  end
end
