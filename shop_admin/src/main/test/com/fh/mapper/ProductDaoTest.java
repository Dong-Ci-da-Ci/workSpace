package com.fh.mapper;

import com.fh.model.vo.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class ProductDaoTest {

    @Autowired
    private ProductDao productDao;

    @Test
    public void testSelectProductList(){
        List<Product> productList = productDao.selectList(null);
        for(Product product : productList){
            System.out.println(product);
        }


    }

}
