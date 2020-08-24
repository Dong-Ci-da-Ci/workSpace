package com.fh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.model.Car;

//继承BaseMapper接口时传入的泛型为你要操作的实体类
public interface CarMapper extends BaseMapper<Car> {
}
