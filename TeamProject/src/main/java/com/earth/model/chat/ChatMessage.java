package com.earth.model.chat;

import lombok.Data;

@Data
public class ChatMessage {
    private String roomId;
    private String messageId;
    private String message;//내용
    private String name;
    private String email;
    private String unReadCount;
    private String sessionCount;



}
