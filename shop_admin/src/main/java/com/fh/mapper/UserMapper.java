package com.fh.mapper;

import com.fh.model.vo.User;

public interface UserMapper {
    User selectByName(String username);
}
