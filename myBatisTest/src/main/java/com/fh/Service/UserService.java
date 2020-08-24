package com.fh.Service;

import com.fh.model.User;

import java.io.IOException;

public interface UserService {
    User queryByName(String username) throws IOException;
}
