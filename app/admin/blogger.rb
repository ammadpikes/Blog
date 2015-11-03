ActiveAdmin.register Blogger do

  permit_params :title, :content, :user_id, :is_published
  scope :unApprovedBlogs

  index do 
    column :id
    column "Created By " do |blogger|
      blogger.user.email
    end
    column "Content", :content
    column "Created at " do |blogger|
      "#{time_ago_in_words(blogger.created_at)}"
    end
    column "Approved", :is_published
    actions
  end

end
