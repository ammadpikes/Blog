require 'populator'
require 'faker'

namespace :db do

  desc "Erase & Populate Database"
  task :populate => :environment do
    User.populate(2) do |user|
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(:password => 'password').encrypted_password
      user.sign_in_count = 1
      Blogger.populate(2) do |blog|
        blog.title = Faker::Lorem.words(6)
        blog.content = Faker::Lorem.paragraph(3)
        blog.user_id = user.id
        type = 'User'
        Comment.populate(2) do |comment|
          comment.name = Faker::Name.name
          comment.content = Faker::Lorem.sentence
          type = 'Blogger'
          comment.blogger_id = blog.id
          comment.user_id = user.id
          type = 'User'
        end
      end
    end 
  end
end