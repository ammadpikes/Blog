class User < ActiveRecord::Base
  
  # Model Associations
  has_many :bloggers, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  # Devise Methods
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # , :confirmable


  # For PaperClip Gem
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url:  "http://www.sinaiem.org/people/files/2013/03/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  # Method for username extracted from the email
  def username
    self.email.split('@').first.upcase
  end

  # Overriding Devise Own Method
  def after_confirmation
    WelcomeMailer.welcome_email(self).deliver
  end

  # Mailboxer Method overriden for email. 
  def mailboxer_email(object)
    email
  end

end