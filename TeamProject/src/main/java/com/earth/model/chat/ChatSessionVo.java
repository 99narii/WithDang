package com.earth.model.chat;

import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component("cSession")
public class ChatSessionVo {
    private static ArrayList<String> loginUser = new ArrayList<>();

    public void addLoginUser(String email) {
        loginUser.add(email);
    }

    //로그인시
    public void removeLoginUser(String email) {
        loginUser.remove(email);
    }

    public static ArrayList<String> getLoginUser() {
        return loginUser;
    }

    public static void setLoginUser(ArrayList<String> loginUser) {
        ChatSessionVo.loginUser = loginUser;
    }

}
