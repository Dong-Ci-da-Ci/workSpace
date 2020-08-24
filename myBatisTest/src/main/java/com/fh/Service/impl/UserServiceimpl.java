package com.fh.Service.impl;

import com.fh.Service.UserService;
import com.fh.mapper.MovieMapper;
import com.fh.model.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;

@Service
public class UserServiceimpl implements UserService {

    @Override
    public User queryByName(String username) throws IOException {
        String resource="SqlMapConfig.xml";
        InputStream resourceAsStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession session = sqlSessionFactory.openSession();
        MovieMapper mapper = session.getMapper(MovieMapper.class);
        User user =  mapper.queryUserName();
        session.close();
        return user;
    }
}
