//package com.earth.mapper;
//
//import com.earth.model.chat.ChatMessage;
//import com.earth.model.chat.ChatRoom;
//import org.apache.ibatis.annotations.Mapper;
//
//import java.util.List;
//@Mapper
//public interface ChatMapper {
//    public ChatRoom selectChatRoom(String roomId);
//
//    public int insertMessage(ChatMessage chatMessage);
//
//    public List<ChatMessage> messageList(String roomId);
//
//    public int createChat(ChatRoom room);
//
//    public ChatRoom searchChatRoom(ChatRoom room);
//
//    public List<ChatRoom> chatRoomList(String userEmail);
//
//    public int selectUnReadCount(ChatMessage message);
//
//    public int updateCount(ChatMessage message);
//}
