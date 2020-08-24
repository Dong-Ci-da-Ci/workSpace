package poi;

import com.fh.model.Car;
import com.fh.service.CarService;
import org.apache.poi.xssf.usermodel.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class PoiTest {

    @Autowired
    private CarService carService;
    @Test
    public void exportExcel() throws IOException {
        List<Car> carList = carService.queryAllCarList();
        XSSFWorkbook  workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("汽车");
        XSSFRow row = sheet.createRow(0);
        //创建表格
        XSSFCell cell = row.createCell(0);
        cell.setCellValue("汽车编号");
        XSSFCell cell2 = row.createCell(1);
        cell2.setCellValue("汽车名称");
        XSSFCell cell3 = row.createCell(2);
        cell3.setCellValue("汽车价格");
        XSSFCell cell4 = row.createCell(3);
        cell4.setCellValue("是否上市");
        XSSFCell cell5 = row.createCell(4);
        cell5.setCellValue("汽车配置");
        XSSFCell cell6 = row.createCell(5);
        cell6.setCellValue("汽车简介");
        XSSFCell cell7 = row.createCell(6);
        cell7.setCellValue("出厂日期");
        XSSFCell cell8 = row.createCell(7);
        cell8.setCellValue("修改日期");
        XSSFCell cell9 = row.createCell(8);
        cell9.setCellValue("品牌名称");


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



        workbook.write(new FileOutputStream("d:/汽车.xlsx"));






    }



}
