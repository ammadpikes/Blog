class User < ActiveRecord::Base
  
  has_many :bloggers, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # , :confirmable

  acts_as_messageable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url:  "http://www.sinaiem.org/people/files/2013/03/missing.png"
  
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  def username
    self.email.split('@').first.upcase
  end

  # Overriding Devise Own Method
  def after_confirmation
    WelcomeMailer.welcome_email(self).deliver
  end

end