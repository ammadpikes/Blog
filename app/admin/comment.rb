ActiveAdmin.register Comment, as: "User Comments" do

  permit_params :name, :content, :blogger_id, :user_id

  index do 
    column :name
    column :content
    column "User's Email" do |comment|
      comment.user.email
    end
    column "Blog's Title" do |comment|
      link_to comment.blogger.id, admin_blogger_path(comment)
    end
    actions
  end

end
