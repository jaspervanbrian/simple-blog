class ConversationsUsersRepository
  def get_user_conversation(user_id, my_id)
    conversation = Conversation.new
    conversationsUsers = ConversationsUser.where(user_id: [user_id, my_id])
    conversationsUsers.each do |conversationUser|
      conversation = conversationUser.conversation # conversation between me and the user clicked
      users = conversation.users # users of this conversation
      if conversation.name.nil? && (users.length === 2) && ((users.include?(@user.id) && users.include?(session[:user_id]))) # Checks if the conversation has only 2 users (You and your friend) and the default is no conversation name because it uses your friends name as convo name
        conversation = conversation
      end
    end
    conversation
  end
end