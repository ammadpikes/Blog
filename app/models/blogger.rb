class Blogger < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, length: {minimum: 5}, uniqueness: true

end
