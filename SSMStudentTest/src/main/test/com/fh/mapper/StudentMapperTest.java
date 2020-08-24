package com.fh.mapper;

import com.fh.model.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class StudentMapperTest {

    @Autowired
    private StudentMapper studentMapper;

    @Test
    public void testQueryStudent(){
        List<Student> studentList  =  studentMapper.queryStudentList();
        for (int i = 0; i <studentList.size();i++){
            System.out.println(studentList);
        }
    }


}
