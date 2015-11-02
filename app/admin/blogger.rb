ActiveAdmin.register Blogger do

  index do 
    column :id
    column "Created By " do |blogger|
      blogger.user.email
    end
    column "Content", :content
    column "Created at " do |blogger|
      "#{time_ago_in_words(blogger.created_at)}"
    end
  end

end
