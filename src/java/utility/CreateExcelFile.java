/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import  java.io.*;
    import  org.apache.poi.hssf.usermodel.HSSFSheet;
    import  org.apache.poi.hssf.usermodel.HSSFWorkbook;
    import  org.apache.poi.hssf.usermodel.HSSFRow;

    public class CreateExcelFile{
         public static void main(String[]args){
        try{
        String filename="D:/NewBatch.xls" ;
        HSSFWorkbook workbook=new HSSFWorkbook();
        HSSFSheet sheet =  workbook.createSheet("FirstSheet");  

        HSSFRow rowhead=   sheet.createRow((short)0);
        rowhead.createCell((short) 0).setCellValue("enrollment");
        rowhead.createCell((short) 1).setCellValue("computer_code");
        rowhead.createCell((short) 2).setCellValue("name");
        rowhead.createCell((short) 3).setCellValue("gender");
        rowhead.createCell((short) 4).setCellValue("category");
        rowhead.createCell((short) 5).setCellValue("mobile_number");
        rowhead.createCell((short) 6).setCellValue("phone_number");
        rowhead.createCell((short) 7).setCellValue("parent_mobile");
        rowhead.createCell((short) 8).setCellValue("father_name");
        rowhead.createCell((short) 9).setCellValue("mother_name");
        rowhead.createCell((short) 10).setCellValue("local_guardian");
        rowhead.createCell((short) 11).setCellValue("local_guardian_number");
        rowhead.createCell((short) 12).setCellValue("emailid");
        rowhead.createCell((short) 13).setCellValue("dob");
        rowhead.createCell((short) 14).setCellValue("blood_group");
        rowhead.createCell((short) 15).setCellValue("10th");
        rowhead.createCell((short) 16).setCellValue("12th");
        rowhead.createCell((short) 17).setCellValue("diploma");
        rowhead.createCell((short) 18).setCellValue("qualifying_exam");
        rowhead.createCell((short) 19).setCellValue("qualifying_exam_marks");
        FileOutputStream fileOut =  new FileOutputStream(filename);
        workbook.write(fileOut);
        fileOut.close();
        System.out.println("Your excel file has been generated!");

        } catch ( Exception ex ) {
            System.out.println(ex);

        }
           }
       }