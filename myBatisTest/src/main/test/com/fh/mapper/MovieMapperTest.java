package com.fh.mapper;

import com.fh.model.Movie;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class MovieMapperTest {
    private MovieMapper mapper;
    private SqlSession session;

    //全局变量
    @Before
    public void bulidSqlSessionFactory() throws IOException {
        String resource="SqlMapConfig.xml";
        InputStream resourceAsStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        session = sqlSessionFactory.openSession();
        mapper = session.getMapper(MovieMapper.class);
    }

    //查询
    @Test
    public void queryMovieTest() throws IOException {

        List<Movie> movies = mapper.queryMovieList();
        for(Movie m:movies){
            System.out.println(m);
        }
    }

    //根据名称查询
    @Test
    public void testQueryMovieByName(){
        Movie movie =  mapper.queryMovieName("范");
        System.out.println(movie);
        session.close();
    }

    //根据ID查询
    @Test
    public void testQueryMovieByid(){
        Movie movie =  mapper.queryMovieid(2);
        System.out.println(movie);
        session.close();
    }

    //新增
    @Test
    public void  testAddMovie(){
        Movie movie =  new Movie();
        movie.setName("小明同学");
        movie.setPrice(24.3);
        movie.setShowTime(new Date());
        mapper.addMovie(movie);
        session.commit();
        session.close();

    }
    //删除
    @Test
    public  void testDeleteMovie(){
       mapper.deleteMovie(1);
       session.commit();
       session.close();
    }
    //批量删除

    @Test
    public void testDeleteBatchMovie(){
       mapper.deleteBatchMovie(Arrays.asList(2,3));
        session.commit();
        session.close();
    }


    //修改
    @Test
    public void updateMovie(){
       Movie movie = new Movie();
       movie.setId(4);
        movie.setName("同学");
        movie.setPrice(32.9);
        movie.setShowTime(new Date());
        mapper.updateMovie(movie);
        session.commit();
        session.close();


    }






}
