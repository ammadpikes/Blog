class CreateBloggers < ActiveRecord::Migration
  def change
    create_table :bloggers do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
