package com.fh.service;

import com.fh.model.vo.User;

public interface UserService {
    User selectByName(String username);
}
