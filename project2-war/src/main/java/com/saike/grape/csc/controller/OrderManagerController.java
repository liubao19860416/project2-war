package com.saike.grape.csc.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saike.ebiz.grape.vo.OrderCsc;
import com.saike.ebiz.rigida.service.api.ReportService;


/**
 * CSC项目订单管理相关操作
 * 
 */
@Controller
@RequestMapping("/grape/order")
public class OrderManagerController extends CSCBaseController {

	private static Logger logger = LoggerFactory.getLogger(OrderManagerController.class);

	//@Resource
	private ReportService reportService;


	/**
	 * 根据组合条件以CSV文件格式导出订单列表
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/exportOrderCSV")
	public void exportOrderCSV(HttpServletResponse response, HttpServletRequest request){
		logger.info("######根据组合条件以CSV文件格式导出订单列表######");
		Map<String, Object> params = new HashMap<String, Object>();

		String orderStatus = request.getParameter("orderStatus")==null?"":request.getParameter("orderStatus").toString();
		params.put("orderStatus", orderStatus);
		String orderNo = request.getParameter("orderNo")==null?"":request.getParameter("orderNo").toString();
		params.put("orderNo", orderNo);
		String orderUName = request.getParameter("orderUName");	
		String orderUTel = request.getParameter("orderUTel")==null?"":request.getParameter("orderUTel").toString();
		params.put("orderUTel", orderUTel);
		String orderMinAmt = request.getParameter("orderMinAmt")==null?"":request.getParameter("orderMinAmt").toString();
		params.put("orderMinAmt", orderMinAmt);
		String orderMaxAmt = request.getParameter("orderMaxAmt")==null?"":request.getParameter("orderMaxAmt").toString();
		params.put("orderMaxAmt", orderMaxAmt);
		String createStartTime = request.getParameter("beginCreateTime")==null?"":request.getParameter("beginCreateTime").toString();
		params.put("createStartTime", createStartTime);
		String createEndTime = request.getParameter("endCreateTime")==null?"":request.getParameter("endCreateTime").toString();
		params.put("createEndTime", createEndTime);
		String dealerId = request.getParameter("dealerId")==null?"":request.getParameter("dealerId").toString();
		params.put("dealerId", dealerId);		
		String vlp=request.getParameter("vlp");	
		try {
			if(vlp!=null ){
				vlp = new String(vlp.getBytes("iso-8859-1"), "utf-8");
			}
			if(orderUName!=null ){
				orderUName = new String(orderUName.getBytes("iso-8859-1"), "utf-8");
			}

		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		params.put("vlp", vlp);
		params.put("orderUName", orderUName);
		try {
			//根据组合条件查询订单总数量
			//Integer totalCount = orderService.getCscOrderListToPcByCondCount(params);
			
			/*if(totalCount>100000){
				PrintWriter out = response.getWriter();
				out.print("<script>alert('导出报表数据过多！请添加筛选条件！');</script>");
			}*/
			
			params.put("pageIndex", 1);
			params.put("rowCount", totalCount);

			List<String> headList = new ArrayList<String>();
			headList.add("订单号");
			headList.add("保养时间");
			headList.add("经销商");
			headList.add("客户姓名");
			headList.add("手机号");
			headList.add("订单价格");
			headList.add("下单时间");
			headList.add("最后更新时间");
			headList.add("订单状态");
			headList.add("设备号");
			headList.add("会员号");
			headList.add("车牌号");
			headList.add("激活通道");

			//根据组合条件查询订单列表
			List<OrderCsc> orderList = orderService.getCscOrderListToPcByCondPage(params);
			
			// 创建Excel工作簿        
			Workbook wb = new HSSFWorkbook();        
			// 创建第一个sheet（页），并命名        
			Sheet sheet = wb.createSheet("订单报表");        
			// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。        
			sheet.setColumnWidth((short) 0, (short) (35.7 * 150));        
			sheet.setColumnWidth((short) 1, (short) (35.7 * 150));        
			sheet.setColumnWidth((short) 2, (short) (35.7 * 150));        
			sheet.setColumnWidth((short) 3, (short) (35.7 * 100));        
			sheet.setColumnWidth((short) 4, (short) (35.7 * 250));        
			sheet.setColumnWidth((short) 5, (short) (35.7 * 150));        
			sheet.setColumnWidth((short) 6, (short) (35.7 * 150));
			sheet.setColumnWidth((short) 7, (short) (35.7 * 150));  
			sheet.setColumnWidth((short) 8, (short) (35.7 * 150)); 
			sheet.setColumnWidth((short) 9, (short) (35.7 * 150)); 
			sheet.setColumnWidth((short) 10, (short) (35.7 * 150));
			sheet.setColumnWidth((short) 11, (short) (35.7 * 150)); 
			sheet.setColumnWidth((short) 12, (short) (35.7 * 150)); 
			// 创建第一行        
			Row row = sheet.createRow((short) 0);        
			// 创建两种单元格格式        
			CellStyle cs = wb.createCellStyle();        
			CellStyle cs2 = wb.createCellStyle();        

			// 创建两种字体        
			Font f = wb.createFont();        
			Font f2 = wb.createFont();        
			// 创建表头字体样式        
			f.setFontHeightInPoints((short) 10);        
			f.setColor(IndexedColors.RED.getIndex());        
			f.setBoldweight(Font.BOLDWEIGHT_BOLD);        
			// 创建数据字体样式        
			f2.setFontHeightInPoints((short) 10);        
			f2.setColor(IndexedColors.BLACK.getIndex());        
			f2.setBoldweight(Font.BOLDWEIGHT_NORMAL);        
			// 设置表头单元格的样式       
			cs.setFont(f);   
			cs.setBorderLeft(CellStyle.BORDER_THIN);        
			cs.setBorderRight(CellStyle.BORDER_THIN);        
			cs.setBorderTop(CellStyle.BORDER_THIN);        
			cs.setBorderBottom(CellStyle.BORDER_THIN);        

			// 设置数据单元格的样式        
			cs2.setFont(f2);        
			// 设置单元格为文本格式
			cs2.setDataFormat((short)Cell.CELL_TYPE_STRING);
			cs2.setBorderLeft(CellStyle.BORDER_THIN);        
			cs2.setBorderRight(CellStyle.BORDER_THIN);        
			cs2.setBorderTop(CellStyle.BORDER_THIN);        
			cs2.setBorderBottom(CellStyle.BORDER_THIN);        

			// 创建列（每行里的单元格） 
			Cell cell = null;
			for (int i = 0; i < headList.size(); i++) {
				cell = row.createCell(i);        
				cell.setCellValue(headList.get(i));        
				cell.setCellStyle(cs); 
			}
			
			if(orderList!=null && orderList.size()>0){
				for (int i = 0; i < orderList.size(); i++) {        
				    OrderCsc order = orderList.get(i);
					// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的            
					// 创建一行，在页sheet上           
					row = sheet.createRow(i + 1);            
					// 在row行上创建一个方格            
					cell = row.createCell(0);            
					cell.setCellValue(order.getOrderNo());            
					cell.setCellStyle(cs2);            
					cell = row.createCell(1);            
					cell.setCellValue(order.getMaintTime());            
					cell.setCellStyle(cs2);      
					cell = row.createCell(2);            
					cell.setCellValue(order.getDealerName());            
					cell.setCellStyle(cs2);  
					cell = row.createCell(3);            
					cell.setCellValue(order.getOrderUName());            
					cell.setCellStyle(cs2);            
					cell = row.createCell(4);            
					cell.setCellValue(order.getOrderUTel());            
					cell.setCellStyle(cs2);            
					cell = row.createCell(5);            
					cell.setCellValue(order.getOrderAmt());            
					cell.setCellStyle(cs2);            
					cell = row.createCell(6);            
					cell.setCellValue(order.getCreateTime());            
					cell.setCellStyle(cs2);    
					
					cell = row.createCell(7);            
					cell.setCellValue(order.getUpdateTime());            
					cell.setCellStyle(cs2);
					
					String orderStatusText = "";
					switch (order.getOrderStatus()) {
					case "1":
						orderStatusText = "待确认";
						break;
					case "2":
						orderStatusText = "已确认";
						break;
					case "3":
						orderStatusText = "已放弃";		
						break;
					case "9":
						orderStatusText = "保养完工";
						break;
					case "99":
						orderStatusText = "已取消";
						break;
					default:
						break;
					}
					cell = row.createCell(8);            
					cell.setCellValue(orderStatusText);            
					cell.setCellStyle(cs2);    
					cell = row.createCell(9);            
					cell.setCellValue(order.getDeviceId());            
					cell.setCellStyle(cs2); 
					cell = row.createCell(10);            
					cell.setCellValue(order.getUserId());            
					cell.setCellStyle(cs2);    
					cell = row.createCell(11);            
					cell.setCellValue(order.getVlp());            
					cell.setCellStyle(cs2);  
					cell = row.createCell(12);            
					cell.setCellValue(order.getSource());            
					cell.setCellStyle(cs2); 
				} 
			}

			ByteArrayOutputStream os = new ByteArrayOutputStream();        
			try {            
				wb.write(os);        
			} catch (IOException e) {            
			    logger.error(e.toString());   
			}        
			byte[] content = os.toByteArray();        
			InputStream is = new ByteArrayInputStream(content);        
			// 设置response参数，可以打开下载页面        
			response.reset();        
			response.setContentType("application/vnd.ms-excel;charset=utf-8");        
			response.setHeader("Content-Disposition", "attachment;filename=" + new String(("订单管理报表.xls").getBytes(), "ISO-8859-1"));        
			ServletOutputStream out = response.getOutputStream();        
			BufferedInputStream bis = null;        
			BufferedOutputStream bos = null;        
			try {            
				bis = new BufferedInputStream(is);            
				bos = new BufferedOutputStream(out);            
				byte[] buff = new byte[2048];            
				int bytesRead;            
				// Simple read/write loop.            
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {                
					bos.write(buff, 0, bytesRead);            
				}        
			} catch (final IOException e) {            
				throw e;        
			} finally {            
				if (bis != null)                
					bis.close();            
				if (bos != null)                
					bos.close();        
			}   
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	}



}


