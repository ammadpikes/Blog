ActiveAdmin.register User do

  index do 
    column :id
    column :email
    column "Join Date", :created_at
    column "Blogs count" do |user|
      user.bloggers.count
    end
    actions
  end
end
