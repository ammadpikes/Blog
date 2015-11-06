class Message < ActiveRecord::Base

  belongs_to :conversation
  belongs_to :user

  validates_presence_of :message_body, :conversation_id, :user_id

  scope :unread, -> { where(is_read: false).count }

  def message_time
  created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  def self.unread
  where(["messages.is_read = ?", false].count)
  end

end