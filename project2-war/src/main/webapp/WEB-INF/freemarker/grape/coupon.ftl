<!-- BEGIN PAGE -->
       <style>
        #orderInfo tr td:first-child { text-align: right; background: #eee; }
        #orderInfo tr td:last-child { text-align: left; }
        .radio-space .radio { padding:0;}
        ul,li { list-style:none;padding:0; }
    </style>
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">保养券设置</h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="index.html">主页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li><a href="#">保养券设置</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
            <div class="portlet box blue" id="dealerQuery">
                <div class="portlet-title">
                    <div class="caption">保养券设置</div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="#" class="form-horizontal">
                        <div class="form-body">
                        	<div class="form-group">
                                <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>保养劵类型名</label>
                                <div class="col-md-3">
                                    <input type="text" value="新用户奖励" class="form-control" maxlength="30" id="couponType">
                                </div>
                                <label class="control-label "></label>
                              <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>规则简述</label>
                                <div class="col-md-3">
                                    <input type="text" value="现金抵用券" maxlength="40" class="form-control"  id="couponJianshu">
                                </div>
                                <label class="control-label "></label>
                              <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <div class="form-group">
                                 <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>规则详情</label>
                                 <div class="col-md-5" style="padding-top:7px;" >
                                     <textarea class="form-control" style="height:100px;" id="couponDetail"></textarea>
                                 </div>
                             </div>
                             
                            
                            <div class="form-group">
                                <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>色值1</label>
                                <div class="col-md-3">
                                    <input type="text" value="#BFFEA9" class="form-control"  maxlength="7"   id="colorValue1">
                                </div>
                                
                                <label class="control-label "></label>
                              <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>色值2</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" value="#6CB153" maxlength="7"  id="colorValue2">
                                </div>
                                
                                <label class="control-label "></label>
                              <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            
                            <div>
							<div class="" style="width:650px;border:1px solid #e5e5e5;padding-left:0px;padding-right:0px;padding-bottom:0px;padding-top:13px;margin-left:1px;margin-right:0px;margin-bottom:15px;margin-top:0px;">
							<div style="width:1130px;">	
	                            <div class="form-group" >
	                                <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>时间选择</label>
	                                <div class="col-md-3">
	                                    <select onchange="changTimeForDay()" class="form-control" id="changeTime">
	                                    	<option value='1'>有效期</option>
	                                    	<option value='2' seleted="seleted">截止日期</option>
	                                    </select>
	                                </div>
	                            </div>
	                            <div class="form-group" id="youxiaoqi">
	                                <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>有效期</label>
	                                <div class="col-md-3">
	                                    <input type="text" size="16" placeholder="有效期和截止日期不能同时为空！" maxlength="4" class="form-control"  id="validDays">
	                                </div>
	                                <label class="control-label ">天</label>
	                            </div>
                            
                            	<!--添加截止日期-->
	                        	<div class="form-group" id="jiezhiriqi">
		                            <label class="control-label col-md-2" for="inputWarning">
		                            <p><span style="color: red">*&nbsp;</span>截止日期</p></label>
		                        	<div class="col-md-3">
			                            <div class="input-group date datetime" data-date="">
			                                <input type="text" size="16" class="form-control" name="experiDate" id="experiDate" onchange="setExperiDate(this)" value=""  readOnly="readonly">
				                                <span class="input-group-btn">
				                                    <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
				                                </span>
				                                <span class="input-group-btn">
				                                    <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
				                                </span>
				                        </div>
			                        </div>
	                          	</div>
                          	</div>
                          	</div>	
                        	
                            <div class="form-group">
                                <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>金额</label>
                                <div class="col-md-3">
                                    <input type="text" maxlength="5" class="form-control" id="amount" >
                                </div>
                                <label class="control-label ">元</label>
                                <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <!--  <div class="form-group">
                                 <label class="control-label col-md-1">适用城市</label>
                                 <div class="col-md-3">
                                     <input type="text" class="form-control">
                                 </div>
                                 <label class="control-label ">元</label>
                             </div>-->
                             <hr />
                             <div class="form-group">
                                 <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>适用城市</label>
                                 <div class="col-md-6" style="padding-top:7px;">
                                     <ul class="checkbox-list form-group">
                                     <#if citys?exists>
                                     	<#list citys as city>
                                         <li class="col-md-4"><input type="checkbox"  value="${city.code}" name="city" /><label>${city.name}</label></li>
										</#list>
									</#if>
                                     </ul>
                                 </div>
                             </div>
                             <div class="form-group">
                                 <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>适用品牌</label>
                                 <div class="col-md-6" style="padding-top:7px;">
                                     <ul class="checkbox-list form-group">
                                      <#if brands?exists>
                						<#list brands as brand> 
                                         	<li class="col-md-4"><input value="${brand.velBrandId}" type="checkbox" name="brand" /><label >${brand.velBrandChsName}</label></li>
                                     	 </#list>
           						 		</#if>
                                     </ul>
                                 </div>
                             </div>
                             <div class="form-group">
                                 <label class="control-label col-md-2"><span style="color: red">*&nbsp;</span>备注</label>
                                 <div class="col-md-5" style="padding-top:7px;">
                                     <textarea class="form-control" maxlength="50" style="height:100px;" id="memo"></textarea>
                                 </div>
                             </div>
                             <div class="form-group">
                                 <label class="control-label col-md-1"></label>
                                 <div class="col-md-6 text-right">
                                     <span class="btn blue" onclick="addCoupon()" type="button">确认</span>
                                 </div>
                             </div>
                             <div class="dataTable clearfix">
                                 <table class="table table-bordered table-hover">
                                     <thead>
                                         <tr>
                                             <th>保养劵类型名</th>
                                             <th>规则简述</th>
                                             <th>规则详情</th>
                                             <th>色值1</th>	
                                             <th>色值2</th>		
                                             <th class="hidden01">有效期</th>
                                             <th class="hidden02">截止日期</th>
                                             <th>金额</th>
                                             <th>城市</th>
                                             <th>品牌</th>
                                             <th>备注</th>
                                             <th>状态</th>
                                             <th>修改时间</th>
                                             <th>操作</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                         <tr>
                                             <td id="couponTypeTd"></td>
                                             <td id="couponJianshuTd"></td>
                                             <td id="couponDetailTd"></td>
                                             <td id="colorValue1Td"></td>
                                             <td id="colorValue2Td"></td>
                                             <td id="validDaysTd" class="hidden01"></td>
                                             <td id="experiDateTd" class="hidden02"></td>
                                             <td id="amountTd"></td>
                                             <td id="citysTd"></td>
                                             <td id="brandsTd"></td>
                                             <td id="memoTd"></td>
                                              <td id="starteTd"></td>
                                              <td id="modifyDateTd"></td>
                                             <td><span class="btn blue " onclick="updateStateRun()">启动 </span>
                                                 <span class="btn blue" onclick="updateStateStop()">停止 </span></td>
                                         </tr>
                                     </tbody>
                                 </table>

                             </div>
                         </div>
                     </form>
                     <!-- END FORM-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
        </div>
        <!-- END PAGE -->
        <script>
        jQuery(document).ready(function () {
			
			$("#couponDetail").val("可用于抵扣12种基础保养项目费用，具体以经销商为准。");
          
            initCoupon();
            $('.date-picker').datepicker({
                rtl: App.isRTL(),
                autoclose: true
            });
        });
        var paramLoad={}
        //加载保养劵信息列
        function initCoupon(){
       			 $.ajax({
					   type: "POST",
					   url: "getAllCoupon.htm",
					   data: JSON.stringify(paramLoad),
					   dataType:"json",
					   "contentType":"application/json",
					   "success": function(data){
			          console.log(data[0])
					   var _city=[];
					   var _cityCode=[]
					   var _brandId=[]
					   for(var i  = 0 ; i <data[0].cityList.length; i++){
					   _city.push(data[0].cityList[i].cityName)
					   _cityCode.push(data[0].cityList[i].cityCode)
					   }
					  // console.log(_city.join(','));
					   var _brand=[];
					   for(var i  = 0 ; i <data[0].brandList.length; i++){
					   _brand.push(data[0].brandList[i].brandName)
					   _brandId.push(data[0].brandList[i].brandId)
					   }
					   
					   //初始化数据 
					   	$("#amount").val(data[0].amount);
                        $("#validDays").val(data[0].validDays);
                        $("#memo").val(data[0].memo);
                        
                    for( var k = 0 ; k <$("input[name='city']").length ; k++){

                      for(var s = 0 ; s<_cityCode.length ; s++){

                    if($("input[name='city']")[k].value ==_cityCode[s]){
                        $("input[name='city']")[k].checked=true;
                      }
                  }

               }
               
                for( var i = 0 ; i <$("input[name='brand']").length ; i++){
                     for(var j = 0 ; j<_brandId.length ; j++){

                    if($("input[name='brand']")[i].value ==_brandId[j]){
                        $("input[name='brand']")[i].checked=true;
                      }
                  }
            }
					    $("#couponType").val(data[0].couponType);
					    $("#couponJianshu").val(data[0].summary); 
					    $("#couponDetail").val(data[0].detailDesc);
					    $("#colorValue1").val(data[0].colorValue1);
					    $("#colorValue2").val(data[0].colorValue2); 
						
						//$("#experiDate").val(data[0].endDatetime); 
						$("#experiDate").val(data[0].endDatetime.substring(0,10)); 
					     
					   App.init();
					   $("#couponTypeTd").html(data[0].couponType);
					   $("#couponJianshuTd").html(data[0].summary); 
					   $("#couponDetailTd").html(data[0].detailDesc); 
					   $("#validDaysTd").html(data[0].validDays); 
					   $("#colorValue1Td").html(data[0].colorValue1); 
					   $("#colorValue2Td").html(data[0].colorValue2); 
					 
					   $("#amountTd").html(data[0].amount); 
					   $("#modifyDateTd").html(data[0].modifyDate); 
					   
					   //$("#experiDateTd").html(data[0].endDatetime);
					   $("#experiDateTd").html(data[0].endDatetime.substring(0,10));
					   
					   if(data[0].validDays!=null && data[0].validDays!=0&&data[0].validDays!=""&&data[0].validDays!="0"){
					   		$(".hidden01").show();
					   		$(".hidden02").hide();
					   		$("#changeTime").val(1);
					   		$("#youxiaoqi").show();
							$("#jiezhiriqi").hide();
					   }else{
					   		$("#validDays").val(""); 
					   		$(".hidden01").hide();
					   		$(".hidden02").show();
					   		$("#changeTime").val(2);
					   		$("#youxiaoqi").hide();
							$("#jiezhiriqi").show();
					   }  
					   
					   $("#memoTd").html(data[0].memo); 
					   var starteTd = data[0].states;
					   if(starteTd==1||starteTd=='1'){
					   		$("#starteTd").html("运行");
					   }else{
					   		$("#starteTd").html("停止");
					   }
					   
					    coupId = data[0].coupId;
					  $("#citysTd").html(_city.join(',')); 
					  $("#brandsTd").html(_brand.join(",")); 
					   //console.log(_brand.join(","));
	                	 }
	                 });
        }
	                 
        function unique(arr) {
            var ret = []
            var hash = {}

            for (var i = 0; i < arr.length; i++) {
                var item = arr[i]
                var key = typeof(item) + item
                if (hash[key] !== 1) {
                    ret.push(item)
                    hash[key] = 1
                }
            }

            return ret
        }
        var coupId;
        //更新保养劵状态为运行
		function updateStateRun(){
			var param={
	                states:1,
	                coupId:coupId
	            }
			$.ajax({
				   type: "POST",
				   url: "updateCouponStatus/0.htm",
				   data: JSON.stringify(param),
				   dataType:"json",
				   "contentType":"application/json",
				   "success": function(data){
				     	var info = eval(data);
					     //保存成功
		                 if(info.result==1){
		                 	alert("操作成功!");
		                 	$("#starteTd").html("启动");
		                 }else{
		                 	alert("操作失败!");
		                 }
	                 },
	                "error": function() {
	                   alert("操作失败!");
	                }
	                });
		}
		
		//更新保养劵为停止
		function updateStateStop(){
			var param={
	                states:0,
	                coupId:coupId
	            }
			$.ajax({
				   type: "POST",
				   url: "updateCouponStatus/0.htm",
				   data: JSON.stringify(param),
				   dataType:"json",
				   "contentType":"application/json",
				   "success": function(data){
				     	var info = eval(data);
					     //保存成功
		                 if(info.result==1){
		                 	alert("操作成功!");
		                 	$("#starteTd").html("停止");
		                 }else{
		                 	alert("操作失败!");
		                 }
	                 },
	                "error": function() {
	                   alert("操作失败!");
	                }
	                });
		}

        //保存保养劵
        function addCoupon(){
        
	        var  couponType =$("#couponType").val();
	        var  couponJianshu =$("#couponJianshu").val();
	        var  couponDetail =$("#couponDetail").val();
	        var  colorValue1 =$("#colorValue1").val();
	        var  colorValue2 =$("#colorValue2").val();
            var  cityList = new Array();
            var  brandList = new Array();
            var  amount =$("#amount").val();
            var  validDays=$("#validDays").val();
            if(validDays*1==0){
            	validDays="";
            }
            var  memo=$("#memo").val();
            
            var  experiDate=$("#experiDate").val();
            if(experiDate!=null && experiDate!=""){
            	experiDate += " 23:59:59";
            }
            
            var  states =1;
            if($("#changeTime").val()*1==1){
            	experiDate="";
            }else{
            	validDays="";
            }
           if(couponType==''){
              alert("保养劵类型名不能为空");
              return false;
           }
         //  else if(fucCheckLength(couponType)>30){
         //     alert("保养劵类型名小于等于30字节");
         //     return false;
        //   }
           
           if(couponJianshu==''){
              alert("规则简述不能为空");
              return false;
           }
        //   else if(fucCheckLength(couponJianshu)>40){
        //      alert("规则简述小于等于40字节");
          //    return false;
         //  }
           
           if(couponDetail==''){
              alert("规则详情不能为空");
              return false;
           }
           
           if(colorValue1==''){
              alert("色值1不能为空");
              return false;
           }
           if(colorValue2==''){
              alert("色值2不能为空");
              return false;
           }
           
           var flag=false;//优先级标记flag
 
           var strP=/^\d+$/; //正整数
           if(validDays==''){
              //alert("有效期不能为空");
              //return false;
              flag=true;
           }else if(!strP.test(validDays)){
                alert("有效期必须是正整数");
                return false;
            }else if(validDays<1){
              alert("有效期必须是大于1的整数");
              return false;
            }
            
            if(flag){
	            if(experiDate==''){
	              alert("有效期天数和截止日期不能同时为空");
	              return false;
	           }
            }
            
            
            if(amount==''){
              alert("金额不能为空");
              return false;
            }else if(isNaN(amount)){
                alert("金额必须是数字");
                return false;
            }else if(amount<=1){
              alert("金额必须是大于1的数字");
              return false;
            }
            
           for( var k = 0 ; k <$("input[name='city']").length ; k++){
               if($("input[name='city']")[k].checked){
               var city={};
                city.cityName =$($("input[name='city']")[k]).parent().parent().next("label").text();
                city.cityCode = $("input[name='city']")[k].value;
                cityList.push(city)
               }
           }
           
           for( var i = 0 ; i <$("input[name='brand']").length ; i++){
                if($("input[name='brand']")[i].checked){
                 var brand={};
                    brand.brandName =$($("input[name='brand']")[i]).parent().parent().next("label").text();
                    brand.brandId = $("input[name='brand']")[i].value;
                    brandList.push(brand)
                }
            }
            if(cityList.length<=0){
              alert("城市不能为空");
              return false;
            }
            
            if(brandList.length<=0){
              alert("品牌不能为空");
              return false;
            }
            
            if(memo==''){
              alert("备注不能为空");
              return false;
            }
            
            var param={
                couponType:couponType,
                couponJianshu:couponJianshu,
                couponDetail:couponDetail,
                colorValue1:colorValue1,
                colorValue2:colorValue2,
                validDays:validDays,
                amount: amount,
                states:states,
                memo: memo,
                cityList:cityList,
                brandList:brandList,
                experiDate:experiDate
            }
            console.log(JSON.stringify(param));
            $.ajax({
			   type: "POST",
			   url: "creatCoupon/0.htm",
			   data: JSON.stringify(param),
			   dataType:"json",
			   "contentType":"application/json",
			   "success": function(data){
			     var info = eval(data);
			     //保存成功
                 if(info.result==1){
                 	alert("保存成功!");
                 	//加载保养劵信息列
                 	$.ajax({
					   type: "POST",
					   url: "getAllCoupon.htm",
					   data: JSON.stringify(paramLoad),
					   dataType:"json",
					   "contentType":"application/json",
					   "success": function(data){
					   
					   var _city=[];
					   for(var i  = 0 ; i <data[0].cityList.length; i++){
					   _city.push(data[0].cityList[i].cityName)
					   }
					  // console.log(_city.join(','));
					   var _brand=[];
					   for(var i  = 0 ; i <data[0].brandList.length; i++){
					   _brand.push(data[0].brandList[i].brandName)
					   }
					   $("#couponTypeTd").html(data[0].couponType);
					   $("#couponJianshuTd").html(data[0].summary); 
					   $("#couponDetailTd").html(data[0].detailDesc); 
					   $("#colorValue1Td").html(data[0].colorValue1); 
					   $("#colorValue2Td").html(data[0].colorValue2); 
					   $("#amountTd").html(data[0].amount); 
					   $("#modifyDateTd").html(data[0].modifyDate); 
					   
					   $("#validDaysTd").html(data[0].validDays); 
					   //$("#experiDateTd").html(data[0].endDatetime);
					   $("#experiDateTd").html(data[0].endDatetime.substring(0,10));   
					   
					   if(data[0].validDays!=null && data[0].validDays!=0&&data[0].validDays!=""&&data[0].validDays != 0){
					   		$("#experiDate").val(data[0].endDatetime.substring(0,10)); 
					   		$(".hidden01").show();
					   		$(".hidden02").hide();
					   		$("#changeTime").val(1);
					   		$("#youxiaoqi").show();
							$("#jiezhiriqi").hide();
					   }else{
							$("#validDays").val("");
					   		$(".hidden01").hide();
					   		$(".hidden02").show();
					   		$("#changeTime").val(2);
					   		$("#youxiaoqi").hide();
							$("#jiezhiriqi").show();			
					   } 
					   
					   $("#memoTd").html(data[0].memo); 
					   var starteTd = data[0].states;
					   if(starteTd==1||starteTd=='1'){
					   		$("#starteTd").html("运行");
					   }else{
					   		$("#starteTd").html("停止");
					   }
					   
					    coupId = data[0].coupId;
					  $("#citysTd").html(_city.join(',')); 
					  $("#brandsTd").html(_brand.join(",")); 
					   //console.log(_brand.join(","));
	                	 }
	                 });
                 	
                 }else{
                      alert("保存失败!");
                 }
			   },
			   "error": function(data) {
                   alert("保存失败!");
                }
			});
        }
        //判断字符长度
        function fucCheckLength(strTemp) {
		  var i,sum;
		  sum=0;
		  for(i=0;i<strTemp.length;i++) {
		    if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255)) {
		      sum=sum+1;
		    }else {
		      sum=sum+2;
		    }
		  }
		  return sum;
		}  

		var _experiDate="0";
		$(function(){
		    if( $("#experiDate").val()!==""){
		    	_experiDate = $("#experiDate").val().replace("-","/").replace("-","/");
		    }
		 });
		
		function setExperiDate(o){
		    if(o.value==""){
		    	_experiDate="0";
		    }else{
		    	_experiDate= o.value;
    		}
    		
    		if(_experiDate!="0"){
			    var experiDate = new Date( _experiDate.replace("-","/").replace("-","/")).getTime();
			    var rightNow = new Date().getTime();
			    if(experiDate<=rightNow){
				   	alert("截止日期不可以小于或等于当前时间", 'error');
				    $(o).val("");
			    }
		    }
    		
    	}
    	
	 jQuery(document).ready(function () {   
           //App.init();
           
		   $(".datetime").datetimepicker({
			    isRTL: App.isRTL(),
			    //format: "yyyy-mm-dd hh:ii:ss",
			    format: "yyyy-mm-dd",
			    showMeridian: true,
			    autoclose: true,
			    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
			    //todayBtn: true,
			    minView:2,
			    language: 'zh-CN',
			    todayHighlight:true,
			    keyboardNavigation:true,
			    startDate:new Date(),
			    //daysOfWeekDisabled:[0,6]
			});
	        
	        $('.date-picker').datepicker({
	            rtl: App.isRTL(),
	            autoclose: true
	        }); 
	        changTimeForDay();
        });
        
		function changTimeForDay(){
			if($("#changeTime").val()*1==1){
				$("#youxiaoqi").show();
				$("#jiezhiriqi").hide();
			}else{
				$("#youxiaoqi").hide();
				$("#jiezhiriqi").show();
			}
		
		}
		
    </script>