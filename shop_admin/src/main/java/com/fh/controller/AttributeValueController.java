package com.fh.controller;

import com.fh.model.vo.Attribute;
import com.fh.model.vo.AttributeValue;
import com.fh.service.AttributeValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("AttributeValueController")
public class AttributeValueController {

    @Autowired
    private AttributeValueService attributeValueService;

    @RequestMapping("addAttributeValue")
    @ResponseBody
    public Map addAttributeValue(AttributeValue attributeValue){
        Map<String,Object> map = new HashMap<>();
        try {
            attributeValueService.addAttributeValue(attributeValue);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }
}
