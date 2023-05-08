package com.earth.model.chat;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
public class ChatRoom {
    private String roomId;
    private String userEmail;
    private String userName;
    private String userPic;
    private String masterEmail;
    private String masterName;
    private String masterPic;
    //안읽은 메세지
    private int unReadCount;


}
