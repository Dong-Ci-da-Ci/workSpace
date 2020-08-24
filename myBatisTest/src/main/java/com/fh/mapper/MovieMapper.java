package com.fh.mapper;

import com.fh.model.Movie;
import com.fh.model.User;

import java.util.List;

public interface MovieMapper {
 List<Movie> queryMovieList();


 Movie queryMovieName(String name);

 Movie queryMovieid(int i);

 void addMovie(Movie movie);

 void deleteMovie(int i);


 void deleteBatchMovie(List<Integer> asList);

 void updateMovie(Movie movie);

 //登陆查询用户名是否存在
 User queryUserName();
}
