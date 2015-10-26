class CreateBgs < ActiveRecord::Migration
  def change
    create_table :bgs do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
