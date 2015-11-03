class AddIsPublishedToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :is_published, :boolean, :default => false
  end
end
