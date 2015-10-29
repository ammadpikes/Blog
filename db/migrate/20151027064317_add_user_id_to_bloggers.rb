class AddUserIdToBloggers < ActiveRecord::Migration
  def change
    add_reference :bloggers, :user, index: true, foreign_key: true
  end
end
