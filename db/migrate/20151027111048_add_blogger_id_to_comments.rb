class AddBloggerIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :blogger, index: true, foreign_key: true
  end
end
