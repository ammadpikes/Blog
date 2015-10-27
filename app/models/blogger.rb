class Blogger < ActiveRecord::Base
  belongs_to :user
  validates :title, length: {minimum: 5}, uniqueness: true

end
