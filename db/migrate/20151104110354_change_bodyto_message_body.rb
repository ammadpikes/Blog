class ChangeBodytoMessageBody < ActiveRecord::Migration
  def change
    rename_column :messages, :body, :message_body
  end
end
