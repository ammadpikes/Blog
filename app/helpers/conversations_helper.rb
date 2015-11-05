module ConversationsHelper

   def to_whom_user_chatting
    if @conversation.sender_id == current_user.id || @conversation.receiver_id == current_user.id
      if @conversation.sender_id == current_user.id
        User.find(@conversation.receiver_id)
      else
        User.find(@conversation.sender_id) 
      end
   end

  end

end
