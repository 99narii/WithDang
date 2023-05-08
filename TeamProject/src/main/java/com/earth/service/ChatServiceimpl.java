package com.earth.service;

import com.earth.model.chat.ChatMessage;
import com.earth.model.chat.ChatRoom;

import java.util.List;

public class ChatServiceimpl implements ChatService {
    @Override
    public ChatRoom selectChatRoom(String roomId) {
        return null;
    }

    @Override
    public int insertMessage(ChatMessage chatMessage) {
        return 0;
    }

    @Override
    public List<ChatMessage> messageList(String roomId) {
        return null;
    }

    @Override
    public int createChat(ChatRoom chatRoom) {
        return 0;
    }

    @Override
    public ChatRoom searchChatRoom(ChatRoom chatRoom) {
        return null;
    }

    @Override
    public List<ChatRoom> chatRoomList(String userEmail) {
        return null;
    }

    @Override
    public int selectUnReadCount(ChatMessage message) {
        return 0;
    }

    @Override
    public int updateCount(ChatMessage chatMessage) {
        return 0;
    }
}
