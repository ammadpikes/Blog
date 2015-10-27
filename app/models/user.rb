class User < ActiveRecord::Base
  
  has_many :bloggers, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Upper Mentioed all Functions are available in this application. That's why declared like that.

end
