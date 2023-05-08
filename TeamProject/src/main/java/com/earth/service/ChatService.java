package com.earth.service;

import com.earth.model.chat.ChatMessage;
import com.earth.model.chat.ChatRoom;

import java.util.List;

public interface ChatService {
    ChatRoom selectChatRoom(String roomId);

    int insertMessage(ChatMessage chatMessage);

    List<ChatMessage> messageList(String roomId);

    int createChat(ChatRoom chatRoom);

    ChatRoom searchChatRoom(ChatRoom chatRoom);

    List<ChatRoom> chatRoomList(String userEmail);

    int selectUnReadCount(ChatMessage message);

    //읽은 메세지 숫자 0으로
    int updateCount(ChatMessage chatMessage);
    
}
