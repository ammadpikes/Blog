class User < ActiveRecord::Base
  
  has_many :bloggers, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # Upper Mentioed all Functions are available in this application. That's why declared like that.

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url:  "http://www.sinaiem.org/people/files/2013/03/missing.png"
  
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  def username
    self.email.split('@').first.upcase
  end

end
