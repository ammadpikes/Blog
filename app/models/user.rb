class User < ActiveRecord::Base
  
  has_many :bloggers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Upper Mentioed all Functions are available in this application. That's why declared like that.

end
