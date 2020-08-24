package com.fh.service;

import com.fh.model.User;

public interface UserService {
    User selectByName(String username);
}
