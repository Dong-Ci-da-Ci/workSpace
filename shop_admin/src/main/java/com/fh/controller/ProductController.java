package com.fh.controller;

import com.fh.model.po.AttributeQuery;
import com.fh.model.po.ProductQuery;
import com.fh.model.vo.*;
import com.fh.service.ProductAttributeValueService;
import com.fh.service.ProductService;
import com.fh.service.ProductSkuService;
import com.fh.util.DataTableResult;
import com.fh.util.FileUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("ProductController")
public class ProductController {
    //导入日志
    private static final Logger LOGGER = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductAttributeValueService productAttributeValueService;

    @Autowired
    private ProductSkuService productSkuService;

    // 跳转到商品页面
    @RequestMapping("toProductList")
    public String toProductList(){
        return "/product/product-list";
    }


    //查询数据queryProductList
    @RequestMapping("queryProductList")
    @ResponseBody
    public DataTableResult queryProductList(ProductQuery productQuery){
        DataTableResult dataTableResult= productService.queryProductList(productQuery);
        return dataTableResult;
    }


    // 上传图片
    @RequestMapping("uploadPicture")
    @ResponseBody
    public Map<String,Object> uploadPicture(HttpServletRequest request, MultipartFile images){
        return FileUtil.uploadFile(request, images);
    }

    //查询商品品牌querybrandList
    @RequestMapping("querybrandList")
    @ResponseBody
    public Map<String, Object> querybrandList(){
        Map<String,Object> map = new HashMap<>();
        try {
            List<Brand> brandList = productService.querybrandList();
            map.put("brandList",brandList);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    //新增数据addProduct
    // 新增商品
    @RequestMapping("addProduct")
    @ResponseBody
    public Map<String,Object> addProduct(@RequestBody ProductInfo productInfo){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Map<String,Object> map = new HashMap<>();
        try {
            productService.addProduct(productInfo);
            map.put("success",true);
            LOGGER.info(simpleDateFormat.format(new Date())+"进行了新增操作");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    // 回显商品
    @RequestMapping("getProductById")
    @ResponseBody
    public Map<String,Object> getProductById(Integer id){
        Map<String,Object> map = new HashMap<>();
        try {
            Product product = productService.getProductById(id);
            //回显商品属性值表
            List<ProductAttributeValue> productAttributeValueList = productAttributeValueService.getAttributeListByProductId(id);
            List<ProductSku> productSkuList = productSkuService.queryProductSkuList(id);
            map.put("success",true);
            map.put("product",product);
            map.put("productAttributeValueList",productAttributeValueList);
            map.put("productSkuList",productSkuList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    // 修改商品
    @RequestMapping("updateProduct")
    @ResponseBody
    public Map<String,Object> updateProduct(@RequestBody ProductInfo productInfo){
        Map<String,Object> map = new HashMap<>();
        try {
            productService.updateProduct(productInfo);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }






}
