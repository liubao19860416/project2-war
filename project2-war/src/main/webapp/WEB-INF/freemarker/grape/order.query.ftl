<meta charset="utf-8">
<body class="page-header-fixed">
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">订单查询</h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="index.html">主页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li><a href="#">订单查询</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
            <div class="portlet box blue"id="dealerQuery">
                <div class="portlet-title">
                    <div class="caption">订单查询</div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="queryOrderList.htm" class="form-horizontal"method="post" id="queryOrderList">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-1" for="inputWarning">订单号</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="orderNo"  value="${attrValue.orderNo}">
                                </div>
                                <label class="control-label col-md-1" for="inputWarning">客户姓名</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="orderUName" value="${attrValue.orderUName}">
                                </div>
                                <label class="control-label col-md-1" for="inputWarning">手机号</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="orderUTel" value="${attrValue.orderUTel}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-1" for="inputWarning">经销商</label>
                                <div class="col-md-3">
                                    <select class="form-control" name="dealerId">
                                    <option value="">==请选择==</option>
                                      <#list dealerList as dealer>      
                                       <#if (dealer.dealerId==attrValue.dealerId)>
                                        <option selected="selected" value="${dealer.dealerId}">${dealer.dealerName}</option> 
                                       <#else>
                                        <option value="${dealer.dealerId}">${dealer.dealerName}</option> 
                                       </#if>                                                                                           
                                        </#list>
                                    </select>
                                </div>
                                <label class="control-label col-md-1" for="inputWarning">价格区间</label>
                                <div class="col-md-3">
                                    <div class="input-group input-daterange">
                                        <input type="text" class="form-control" name="orderMinAmt" value="${attrValue.orderMinAmt}"  onkeyup="value=value.replace(/[^\d.]/g,'')">
                                        <span class="input-group-addon">-</span>
                                        <input type="text" class="form-control" name="orderMaxAmt" value="${attrValue.orderMaxAmt}" onkeyup="value=value.replace(/[^\d.]/g,'')">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                                <label class="control-label col-md-1" for="inputWarning">订单状态</label>
                                <div class="col-md-3">
                                    <select class="form-control" name="orderStatus" id="orderStatusInit" method="post">
                                        <option value="">==请选择==</option>
                                        <option value="1">待确认</option>
                                        <option value="2">已确认</option>
                                        <option value="3">已放弃</option>
                                        <option value="9">保养完工</option>
                                        <option value="99">已取消</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-1" for="inputWarning">下单时间</label>
                                <div class="col-md-4">
                                    <div class="input-group date datetime" data-date="">
                                        <input type="text" size="16" class="form-control" id="startTime" name="beginCreateTime" onchange="setTime1(this)" value="${attrValue.createStartTime}"  readOnly="readonly">
                                        <span class="input-group-btn">
                                            <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
                                        </span>
                                        <span class="input-group-btn">
                                            <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group date datetime" data-date="">
                                        <input type="text" size="16" class="form-control" id="endTime" name="endCreateTime" onchange="setTime3(this)"  value="${attrValue.createEndTime}"  readOnly="readonly">
                                        <span class="input-group-btn">
                                            <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
                                        </span>
                                        <span class="input-group-btn">
                                            <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>

                                
                            </div>
                            
                            
                            <div class="form-group">
                            <label class="control-label col-md-1" for="inputWarning">车牌号</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="vlp"  value="${attrValue.vlp}">
                                </div>
                                <div class="col-md-3">
                                 <a href="#" class="btn blue" onclick="exportCrsv(1)">查询</a>&nbsp;&nbsp;
                                    <a href="#" class="btn blue" onclick="exportCrsv(2)">导出</a>
                                </div>
                            </div>
                            <hr />
                            <div class="dataTable">
                              
                                 <!-- 每页显示多少条 -->
                                <div >
                                    <label>每页显示</label>
                                    <select size="1" name="rowCount" id="rowCount"  onchange="submitOrder(1)">
                                        <option value="5" selected="selected">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>                           
                                    </select>
                                    <label>条记录</label>
                                </div>
                                <!-- 每页显示多少条 -->
                                <table class="table table-striped table-bordered table-hover" id="OrderQuery">
                                    <thead>
                                        <tr>
                                            <th>订单号</th>
                                             <th>设备号</th>
                                             <th>会员号</th>
                                            <th>保养时间</th>
                                            <th>经销商</th>
                                            <th>客户姓名</th>
                                            <th>手机号</th>
                                            <th>车牌号</th>
                                            <th>订单价格</th>
                                            <th>下单时间</th>
                                            <th>最后更新时间</th>
                                            <th>订单状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <#list orderList as order>
                                     <tr>
                                            <td>${order.orderNo}</td>
                                            <td>${order.deviceId}</td>
                                            <td>${order.userId}</td>
                                            <td>${order.startTime?substring(0,16)}-${order.endTime?substring(11,16)}</td>
                                            <td>${order.dealerName}</td>
                                            <td>${order.orderUName}</td>
                                            <td>${order.orderUTel}</td>
                                            <td>${order.vlp}</td>
                                            <td>${order.orderAmt}</td>
                                            <td>${order.createTime}</td>
                                            <td>${order.updateTime}</td>
                                            <td>
                                            <#if  order.orderStatus==1>
                                            待确认
                                            <#elseif order.orderStatus==2>
                                            已确认
                                            <#elseif order.orderStatus==3>
                                           已放弃
                                            <#elseif order.orderStatus==9>
                                           保养完工
                                            <#elseif order.orderStatus==11>
                                           保养完工
                                            <#elseif order.orderStatus==99>
                                           已取消
                                            </#if>
                                            </td>
                                            <td><a href="#orderInfo" data-toggle="modal" class="btn btn-xs blue" onclick=queryOrderDetail("${order.orderNo}")>查看</a></td>
                                        </tr>
                                    </#list>
                                     
                                    </tbody>
                                </table>
                                <!-- 分页样式 -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <span>共<span id="pageCount">${pageCount}</span>页，当前第<span id="pageIndex">${attrValue.pageIndex}</span>页</span>
                                        <input type="hidden"  value="1" name="pageIndex" id="hiddenpageIndex">
                                    </div>
                                    <div class="col-md-6">
                                        <div class="dataTables_paginate paging_bootstrap pull-right">
                                            <ul class="pagination">
                                                <li class="prev"><a href="javascript:void(0)" title="前一页" onclick="firstPage(1)"><i class="icon-angle-left"></i></a></li>
                                                <li class="next"><a href="javascript:void(0)" title="后一页" onclick="nextPage(1)"><i class="icon-angle-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- 分页样式 -->
                            </div>
                        </div>
                    </form>
                    <!-- END FORM-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
        </div>
        <!-- END PAGE -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div class="footer">
        <div class="footer-inner">
            2013 &copy; Metronic by keenthemes.
        </div>
        <div class="footer-tools">
            <span class="go-top">
                <i class="icon-angle-up"></i>
            </span>
        </div>
    </div>
    <div class="modal fade" id="orderInfo" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog modal-wide">
            <div class="modal-content well">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">订单详情</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td style="width:120px;">订单号</td>
                            <td><span id="orderNo"></span></td>
                        </tr>
                        <tr>
                            <td>设备号</td>
                            <td><span id="deviceId"></span></td>
                        </tr>
                        <tr>
                            <td>会员号</td>
                            <td><span id="userId"></span></td>
                        </tr>
                        <tr>
                            <td>客户姓名</td>
                            <td><span id="orderUName"></span></td>
                        </tr>
                        <tr>
                            <td>经销商</td>
                            <td><span id="dealerName"></span></td>
                        </tr>
                        <tr>
                                    <td>基础项目</td>
                                    <td data-toggle="orderProjList">
                                    <span id="orderProjList"></span>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td>养护项目</td>
                                    <td data-toggle="csrvProdList">
                                     <span id="csrvProdList"></span>
                                    </td>
                                    </tr>
                        <tr>
                            <td>手机号</td>
                            <td><span id="orderUTel"></span></td>
                        </tr>
                        <tr>
                            <td>车牌号</td>
                            <td><span id="vlp"></span></td>
                        </tr>
                        <tr>
                            <td>行驶公里数</td>
                            <td><span id="vkt"></span> <span id="vktUnit">公里</span></td>
                        </tr>
                        <tr>
                            <td>车型</td>
                            <td><span id="carType"></span></td>
                        </tr>
                        <tr>
                            <td>下单时间</td>
                            <td><span id="createTime"></span></td>
                        </tr>
                        <tr>
                            <td>保养时间</td>
                            <td><span id="maintDate"></span></td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<span id="changeContent"></span>
                        	</td>
                        </tr>
                        <!--<tr>
                            <td>最后更新时间</td>
                            <td><span id="updateTime"></span></td>
                        </tr>
                        <tr>
                            <td>订单状态</td>
                            <td><span id="orderStatus"></span></td>
                        </tr>-->
                        <tr>
                            <td>客户备注</td>
                            <td><span id="userRemark"></span></td>
                        </tr>
                        <tr>
                            <td>经销商备注</td>
                            <td><span id="dealerRemark"></span></td>
                        </tr>
                        <tr>
                            <td>订单价格</td>
                            <td><span id="orderAmt"></span></td>
                        </tr>
                        <tr>
                            <td>激活通道</td>
                            <td><span id="source"></span></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        jQuery(document).ready(function () {
            $('#rowCount').val(${attrValue.rowCount});
            $('#orderStatusInit').val(${attrValue.orderStatus});      
           App.init();
           // OrderQuery.init();
            $("select.form-control").select2;
           $("select.form-control").select2();
		   $(".datetime").datetimepicker({
		    isRTL: App.isRTL(),
		    format: "yyyy-mm-dd hh:ii:ss",
		    showMeridian: true,
		    //minView:1,
		    autoclose: true,
		    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
		    todayBtn: true,
		    language: 'zh-CN'
		});
           
            $('.date-picker').datepicker({
                rtl: App.isRTL(),
                autoclose: true
            });
            $("#dealerInfo").hide();
           
        });
    </script>
    <script >
    function submitOrder(){
    if(status==2){
    $("#queryOrderList").attr("action","exportOrderCSV.htm");
    }else{
    $("#queryOrderList").attr("action","queryOrderList.htm");
    }
    $("#queryOrderList").submit();
    }
    function exportCrsv(status){
    if(status==2){
    $("#queryOrderList").attr("action","exportOrderCSV.htm");
    }else{
    $("#queryOrderList").attr("action","queryOrderList.htm");
    }
    
    $("#queryOrderList").submit();
    }
   function firstPage(status){
    var pageIndex= $('#pageIndex').text();
    if(parseInt(pageIndex)<=1){
    alert("没有前一页");
    return;
    }
    pageIndex--;
    $('#hiddenpageIndex').val(pageIndex)
    $('#pageIndex').text(pageIndex);
    if(status==2){
    $("#queryOrderList").attr("action","exportOrderCSV.htm");
    }else{
    $("#queryOrderList").attr("action","queryOrderList.htm");
    }
    $("#queryOrderList").submit();    
   }
   function nextPage(status){
    var pageIndex= $('#pageIndex').text();
    var pageCount= $('#pageCount').text();
    if(parseInt(pageIndex) >= parseInt(pageCount)){
    alert("没有后一页");
    return;
    }
    pageIndex++;
    $('#hiddenpageIndex').val(pageIndex)
    $('#pageIndex').text(pageIndex);
    if(status==2){
    $("#queryOrderList").attr("action","exportOrderCSV.htm");
    }else{
    $("#queryOrderList").attr("action","queryOrderList.htm");
    }
    $("#queryOrderList").submit();
   }
    
    function queryOrderDetail(orderNo){
    $.ajax({
                                "type": "POST",
                                "url": "queryOrderDetail.htm",
                                "data":  {
                                "orderNo": orderNo//订单号
                                },
                                "dataType": "json",
                                "contentType": "application/x-www-form-urlencoded",
                                "success": function(data) {
                                var modelProject = eval(data);
                                        $('#orderNo').text(modelProject.orderNo);
                                        $('#orderUName').text(modelProject.orderUName);
                                        $('#orderUTel').text(modelProject.orderUTel);
                                        $('#createTime').text(modelProject.createTime);
                                        $('#updateTime').text(modelProject.updateTime);
                                        
                                        $('#dealerName').text(modelProject.dealerName);
                                        $('#userId').text(modelProject.userId);
                                        $('#deviceId').text(modelProject.deviceId);
                                        $('#source').text(modelProject.source);
                                        
                                        var vkt = modelProject.vkt;
                                        if( vkt=="" || vkt== null ||vkt=="-1"){
                                        	$('#vkt').text("未设置");
                                        	$('#vktUnit').text("");
                                        }else{
	                                        $('#vkt').text(modelProject.vkt);
                                        	$('#vktUnit').text("公里");
                                        }
                                        
                                        $('#maintDate').text(modelProject.startTime.substring(0,16)+"-"+modelProject.endTime.substring(11,16));
                                        $('#userRemark').text(modelProject.userRemark);
                                        $('#dealerRemark').text(modelProject.dealerRemark);
                                        $('#orderAmt').text(modelProject.orderAmt);
                                        $('#vlp').text(modelProject.vlp);
                                                 
                                       var type = modelProject.velseriesName+" "+modelProject.velmodelName;
                                       $('#carType').text(type);
                     
                                        var htmlContent="<table class='table table-striped table-bordered table-hover'><tr><td style='width:80px;'>订单状态</td><td style='width:120px;'>更新时间</td></tr>";
                                        for(var i=0;i<modelProject.hisOrderList.length;i++){
                                        	var orderStatus = modelProject.hisOrderList[i].orderStatus;
                                        	var updateTimee = modelProject.hisOrderList[i].updateTime;
                                        	var statusText = "";
                                        	if(orderStatus=="1"){
	                                        	statusText="待确认";
	                                        }else if(orderStatus=="2"){
	                                        	statusText="已确认";
	                                        }else if(orderStatus=="3"){
	                                        	statusText="已放弃";
	                                        }else if(orderStatus=="9"){
	                                        	statusText="保养完工";
	                                        }else if(orderStatus=="11"){
	                                         	statusText="保养完工";
	                                        }else if(orderStatus=="99"){
	                                        	statusText="已取消";
	                                        }      
	                                       htmlContent += "<tr><td>"+statusText+"</td><td><span>"+updateTimee+"</span></td></tr>";
                                        }
                                        htmlContent += "</table>";
                                        
                                       $('#changeContent').html(htmlContent);
                                       
                                        var strOrderProjList="";
                                        var strCsrvProdList="";
                                        for(var i=0;i<modelProject.orderProjList.length;i++){
                                        	strOrderProjList+=modelProject.orderProjList[i].projName+"、";
                                        }
                                        for(var i=0;i<modelProject.csrvProdList.length;i++){
                                        	strCsrvProdList+=modelProject.csrvProdList[i].projName+"、";
                                        }
                                        strCsrvProdList=strCsrvProdList.substring(0,strCsrvProdList.length-1);
                                        strOrderProjList=strOrderProjList.substring(0,strOrderProjList.length-1);
                                        
                                        $('#orderProjList').text(strOrderProjList);
                                        $('#csrvProdList').text(strCsrvProdList);
                                        /*var orderStatus="";
                                        if(modelProject.orderStatus=="1"){
                                        	orderStatus="待确认";
                                        }else if(modelProject.orderStatus=="2"){
                                        	orderStatus="已确认";
                                        }else if(modelProject.orderStatus=="3"){
                                        	orderStatus="已放弃";
                                        }else if(modelProject.orderStatus=="9"){
                                        	orderStatus="保养完工";
                                        }else if(modelProject.orderStatus=="11"){
                                         	orderStatus="保养完工";
                                        }else if(modelProject.orderStatus=="99"){
                                        	orderStatus="已取消";
                                        }                                   
                                        $('#orderStatus').text(orderStatus); */                            
                                        $("#viewDealer").click(function () {
	                                        $("#dealerQuery").hide();
	                                        $("#dealerInfo").show();
                                       })
                                
                                },
                                error:function(){
                                }
                        });
    
         //alert(orderNo);
    	//location.href="queryOrderDetail.htm?orderNo"+orderNo;
    }
     var _time1="0";
    var _time2="0";
    var _time3="0";
    var _time4="0";
     $(function(){
   
    if( $("#startTime").val()!==""){
    _time1 = $("#startTime").val().replace("-","/").replace("-","/");
    }
    if( $("#endTime").val()!==""){
    _time3 = $("#endTime").val().replace("-","/").replace("-","/");
    }
       
    })
     function setTime1(o){
   if(o.value==""){
    _time1="0";
    }else{
    _time1 = o.value;
    }

    if(_time3!="0"){
    var startTime = new Date($(o).val().replace("-","/").replace("-","/")).getTime();
    var endTime = new Date( _time3.replace("-","/").replace("-","/")).getTime();
    if(endTime<=startTime){
  alert("开始时间不可以大于结束时间", 'error');
    $(o).val("");
    }
    }

    }
    function setTime2(o){
    if(o.value==""){
    _time2="0";
    }else{
    _time2 = o.value;
    }

    if(_time4!="0"){
    var startTime = new Date($(o).val().replace("-","/").replace("-","/")).getTime();
    var endTime = new Date( _time4.replace("-","/").replace("-","/")).getTime();
    if(endTime<=startTime){
    alert("开始时间不可以大于结束时间", 'error');

    $(o).val("");
    }
    }

    }
     function setTime3(o){
    if(o.value==""){
    _time3="0";
    }else{
    _time3= o.value;
    }
if(_time1!="0"){
    var startTime = new Date( _time1.replace("-","/").replace("-","/")).getTime();
    var endTime = new Date( $(o).val().replace("-","/").replace("-","/")).getTime();
    if(endTime<=startTime){
   alert("结束时间不可以小于开始时间", 'error');

    $(o).val("");
    }
    }
    }
    function setTime4(o){
    if(o.value==""){
    _time4="0";
    }else{
    _time4 = o.value;
    }
    if(_time2!="0"){
    var startTime = new Date( _time2.replace("-","/").replace("-","/")).getTime();
    var endTime = new Date( $(o).val().replace("-","/").replace("-","/")).getTime();
    if(endTime<=startTime){
    alert("结束时间不可以小于开始时间", 'error');
    $(o).val("");
    }
    }
    }
    
    </script>
    
    <!-- END JAVASCRIPTS -->
</body>
