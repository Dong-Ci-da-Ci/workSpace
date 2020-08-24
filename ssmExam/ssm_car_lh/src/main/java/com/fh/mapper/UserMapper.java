package com.fh.mapper;

import com.fh.model.User;

public interface UserMapper {
    User selectByName(String username);
}
