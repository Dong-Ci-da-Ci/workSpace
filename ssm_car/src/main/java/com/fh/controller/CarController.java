package com.fh.controller;

import com.fh.Book;
import com.fh.ExportExceTest;
import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.service.CarService;
import com.fh.util.*;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("carController")
public class CarController {

    @Autowired
    private CarService service;


    //前往列表显示页面
    @RequestMapping("toList")
    public String toList(){
        return "car-show";
    }

    //查询
    @RequestMapping("queryList")
    @ResponseBody
    public DataTableResult queryList(ConditionQuery conditionQuery) {
        return service.queryList(conditionQuery);
    }

    // 查询下拉列表
    @RequestMapping("queryPullDownList")
    @ResponseBody
    public List<Brand> queryMovieAreaList(){
        List<Brand> list = service.queryPullDownList();
        return list;
    }

    // 添加
    @RequestMapping("addCar")
    @ResponseBody
    public Map<String,Object> addCar(Car car){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addCar(car);
            map.put("success" , true);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success" , false);
        }
        return map;
    }

    // 删除车辆
    @RequestMapping("deleteCar")
    @ResponseBody
    public void deleteCar(int carId){
        service.deleteCar(carId);

    }

    // 批量删除车辆
    @RequestMapping("deleteBatchCar")
    @ResponseBody
    public Map<String,Object> deleteBatchCar(@RequestParam("ids[]") List<Integer> carIdList){
        Map<String,Object> map = new HashMap<>();
        try {
            service.deleteBatchCar(carIdList);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }


    //回显queryById
    @RequestMapping("queryById")
    @ResponseBody
    public Car queryById(Integer carId) {
        return service.queryById(carId);
    }

    //addCar修改
    @RequestMapping("updateCar")
    @ResponseBody
    public Map<String,Object> updateCar(Car car){
        Map<String,Object> map = new HashMap<>();
        try {
            service.updateCar(car);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;

    }

    // 导入Excel
    @RequestMapping("importExcel")
    @ResponseBody
    public Map<String,Object> importExcel(@RequestParam("file") MultipartFile file){
        Map<String,Object> map  = new HashMap<>();
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
            int numberOfSheets = workbook.getNumberOfSheets();
            for (int i= 0; i<numberOfSheets; i++){
                XSSFSheet sheet = workbook.getSheetAt(i);
                int firstRowNum = sheet.getFirstRowNum();
                int lastRowNum = sheet.getLastRowNum();
                List<Car> carList = new ArrayList<>();
                for (int j =firstRowNum+1; j<=lastRowNum; j++ ){
                    XSSFRow row = sheet.getRow(j);
                    String carName = row.getCell(1).getStringCellValue();
                    double carPrice = row.getCell(2).getNumericCellValue();
                    String isup = row.getCell(3).getStringCellValue();
                    String configure = row.getCell(4).getStringCellValue();
                    String introduction = row.getCell(5).getStringCellValue();
                    Date producedDate = row.getCell(6).getDateCellValue();
                    Date updateDate = row.getCell(7).getDateCellValue();
                    String brand = row.getCell(8).getStringCellValue();
                    //将获取到的单元格数据放到封装好的Car对象中
                    Car car = new Car();
                    car.setCarName(carName);
                    car.setCarPrice((double) carPrice);
                    car.setIsup(isup.equals("是")?1:2);
                    car.setConfigure(configure.replace("少年","1").replace("青年","2").replace("中年","3").replace("老年","4"));
                    car.setIntroduction(introduction);
                    car.setProducedDate(producedDate);
                    car.setUpdateDate(updateDate);
                    car.setBrandId(brand.equals("各位")?1:brand.equals("阿额")?2:3);
                    carList.add(car);


                }

                service.batchAddCar(carList);

            }
            map.put("success",true);

        } catch (IOException e) {
            e.printStackTrace();
            map.put("success",false);
        }

        return map;

    }

    // 导出Excel
    @RequestMapping("exportExcel")
    public void exportExcel(ConditionQuery conditionQuery, HttpServletRequest request, HttpServletResponse response){
        //根据条件查询要导出的数据
        List<Car> carList = service.queryCarListNoPage(conditionQuery);
        // 创建一个工作薄
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 在工作薄中创建一个工作表
        XSSFSheet sheet = workbook.createSheet("汽车列表");
        XSSFRow row = sheet.createRow(0);
        String[] headNameArr = {"汽车编号","汽车名称","汽车价格","是否上市","汽车配置","汽车简介","出厂日期","修改日期","品牌名称"};

        int[] cellWidth = {8*256,20*256,10*256,10*256,10*256,10*256,20*256,20*256,20*256,20*256,10*256};
        for (int i=0; i<headNameArr.length; i++){
            XSSFCell cell = row.createCell(i);
            cell.setCellValue(headNameArr[i]);
            sheet.setColumnWidth(i,cellWidth[i]);
        }

        //创建一个日期格式的单元格
        XSSFCellStyle cellStyle = workbook.createCellStyle();
        XSSFDataFormat dataFormat = workbook.createDataFormat();
        cellStyle.setDataFormat(dataFormat.getFormat("yyyy-MM-dd"));

        //循环往excel中赋值
        for (int i=0; i<carList.size(); i++){
            XSSFRow row1 = sheet.createRow(i + 1);
            XSSFCell c1 = row1.createCell(0);
            c1.setCellValue(carList.get(i).getCarId());

            XSSFCell c2 = row1.createCell(1);
            c2.setCellValue(carList.get(i).getCarName());

            XSSFCell c3 = row1.createCell(2);
            c3.setCellValue(carList.get(i).getCarPrice());

            XSSFCell c4 = row1.createCell(3);
            c4.setCellValue(carList.get(i).getIsup()==1?"是":"否");

            XSSFCell c5 = row1.createCell(4);
            c5.setCellValue(carList.get(i).getConfigure().replace("1","少年").replace("2","青年").replace("3","中年").replace("4","老年"));

            XSSFCell c6 = row1.createCell(5);
            c6.setCellValue(carList.get(i).getIntroduction());

            XSSFCell c7 = row1.createCell(6);
            c7.setCellValue(carList.get(i).getProducedDate());
            c7.setCellStyle(cellStyle);

            XSSFCell c8 = row1.createCell(7);
            c8.setCellValue(carList.get(i).getUpdateDate());
            c8.setCellStyle(cellStyle);

            XSSFCell c9 = row1.createCell(8);
            c9.setCellValue(carList.get(i).getBrandId()==1?"各位":carList.get(i).getBrandId()==2?"阿额":"其他");



        }
        // 调用工具类中的下载方法
        ExcelUtil.excelDownload(workbook,request,response,UUID.randomUUID().toString()+".xlsx");


    }
    //导出word
    @RequestMapping("exportWordFreeMarker")
    public void exportWordFreeMarker(ConditionQuery conditionQuery, HttpServletRequest request, HttpServletResponse response) throws IOException, TemplateException {
        try {
            List<Car> carList = service.queryCarListNoPage(conditionQuery);
            Map<String,Object> map = new HashMap<>();
            map.put("carList",carList);
            File file = FreemarkerUtil.generateWord(map,"car.ftl","/template",request);
            //下载word
            FileUtil.downloadFile(file,"car.doc",request,response);
            //删除服务器上生成的word
            file.delete();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    //导出 exportPdfFreeMarker
    //导出word
    @RequestMapping("exportPdfFreeMarker")
    public void exportPdfFreeMarker(ConditionQuery conditionQuery, HttpServletRequest request, HttpServletResponse response)  {
        try {

            //5.创建数据模型
            Map<String,Object> dataMap = new HashMap<>();
            List<Car> carList = service.queryCarListNoPage(conditionQuery);
            dataMap.put("carList",carList);
            //调用fileMarkerUtil中的pdf方法
            File file = FreemarkerUtil.generatePdf(dataMap, "pdf.ftl","/template", request);
            //调用fileUtil中的下载方法
            FileUtil.downloadFile(file,"汽车列表.pdf",request,response);
            //删除服务器上生成的word
            file.delete();
        } catch (IOException  e) {
            e.printStackTrace();
        }

    }






}
















