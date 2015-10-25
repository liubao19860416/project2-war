<!-- BEGIN PAGE -->
 <style>


        .pagination {
            font-size: 80%;
        }

        .pagination a {
            text-decoration: none;
            border: solid 1px #AAE;
            color: #15B;
        }

        .pagination a, .pagination span {
            display: block;
            float: left;
            padding: 0.3em 0.5em;
            margin-right: 5px;
            margin-bottom: 5px;
        }

        .pagination .current {
            background: #26B;
            color: #fff;
            border: solid 1px #AAE;
        }

        .pagination .current.prev, .pagination .current.next{
            color:#999;
            border-color:#999;
            background:#fff;
        }
        .nav-tabs>li>a {
         border-color: #eee #eee #ddd;
       }
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus {
color: #FFFFFF;
cursor: default;
background-color:#4d90fe;
border: 1px solid #ddd;
border-bottom-color: transparent;
}
xmp{
width:500px;white-space:normal;
}
input[readonly], select[readonly], textarea[readonly] {
cursor: default  !important;
background-color: #F9F9F9 !important;
}
    </style>
<div class="page-content">
<!-- BEGIN PAGE HEADER-->
<!-- BEGIN PAGE TITLE & BREADCRUMB-->
<h3 class="page-title">数据统计</h3>
<ul class="page-breadcrumb breadcrumb">
    <li>
        <i class="icon-home"></i>
        <a href="index.html">主页</a>
        <i class="icon-angle-right"></i>
    </li>
    <li><a href="#">数据统计</a></li>
</ul>
<!-- END PAGE TITLE & BREADCRUMB-->
  <div class="bs-example bs-example-tabs">
        <ul id="myTab" class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#active" role="tab" data-toggle="tab">激活量统计</a></li>
            <li><a id="od" href="#order" role="tab" data-toggle="tab">订单统计</a></li>

        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="active">
 <form action="${request.contextPath}/grape/order/orderStatistics.htm" class="form-horizontal" method="post">
                        <div class="form-body">
                          
                         <input  type="hidden" name="tabName" value="1" />

                            <div class="form-group">
                                <label class="control-label col-md-2"> 激活日期</label>
                                <div class="col-md-3">
                                <div class="input-group date datetime">
                            <input name="createTimeStart"  id="createTimeStart" value="${(createTimeStart)!''}"  type="text" size="16" onchange="setTime5(this)" class="form-control" readOnly="readonly">
                            <span class="input-group-btn">
                                <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
                            </span>
                            <span class="input-group-btn">
                                <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
                            </span>
                        </div>
                                   
                                     </div>
                                        <div class="col-md-3">
                                     <div class="input-group date datetime">
                            <input name="createTimeEnd"  id="createTimeEnd" value="${(createTimeEnd)!''}"  type="text" size="16" class="form-control"onchange="setTime6(this)"  readOnly="readonly">
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
      						<label class="control-label col-md-2">激活渠道</label>
      						
                                <div class="col-md-2">
                                    <select id="activeStatus" name="activeStatus" class="form-control">
                                        <option value="" selected="selected">==请选择==</option>
                                        
                                        <#if (activaSourceList?if_exists)>
				                        	<#list activaSourceList as source>
				                        	
				                        		<#if (activeStatus==source && source!="")>
				                        <option selected="selected"   value="${source}">${source}</option>	
	                        		
	                        		<#else>
	                        			<option value="${source}">${source}</option>
	                        		</#if>
				                   
				                        	</#list>
			                        	</#if>
			                        	
                                    </select>

                              
                            </div>
                            </div>
       <div class="form-group">
                          
                             
                                <label class="control-label col-md-4"></label>
                                <div class="col-md-6">
                                    
                                </div>
                                 <div class="col-md-2">
                                <#--20140902
                                 <a href="#" class="btn blue" onclick="exportCrsv(1)">查询</a>
                                 -->
                                 <button class="btn blue" type="submit">查询</button>
                               
                                </div>
                            </div>
           	
                        </div>
                     </form>

            <div class="portlet box blue">
    <div class="portlet-title">
        <div class="caption">激活量统计详情</div>
    </div>
    <div class="portlet-body form">
        <div class="form-body">
        
            <div id="main" style="height: 400px;font-family: Microsoft Yahei">

            </div>
               <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color:#4A8DF8">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="color:white">
                               	激活量信息
                            </a>
                        </h4>
                    </div>
                    
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>激活通道</th>
                                        <th>激活量</th>
                                          
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if (activationList?if_exists)>
			                        	<#list activationList?sort_by('source') as active>
			                        		<tr>
		                                        <td>${active.source}</td>
		                                        <td>${active.counts}</td>
		                                     
		                                    </tr>
			                        	</#list>
		                        	</#if>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                    </div>
                    
                </div>

            </div>
        </div>
    </div>
</div>
            </div>
            <div class="tab-pane fade" id="order">
             <div class="portlet box blue">
    <div class="portlet-title">
        <div class="caption">订单统计</div>
    </div>
    <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="${request.contextPath}/grape/order/orderStatistics.htm" method="post" class="form-horizontal">
            <div class="form-body">
                <div class="form-group">
                    <label class="control-label col-md-1" for="inputWarning">保养时间</label>
                            <input  type="hidden" name="tabName" value="2" />
                    <div class="col-md-4">
	                    <div class="input-group date datetime">
	                        <input name="maintStartTime" id="startTime" value="${(attrValue.maintStartTime)!''}" onchange="setTime1(this)" type="text" size="16" class="form-control" readOnly="readonly">
	                        <span class="input-group-btn">
	                            <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
	                        </span>
	                        <span class="input-group-btn">
	                            <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
	                        </span>
	                    </div>
	                </div>
	                
					<div class="col-md-4">
                        <div class="input-group date datetime">
                            <input name="maintEndTime"  id="endTime" value="${(attrValue.maintEndTime)!''}" onchange="setTime3(this)" type="text" size="16" class="form-control" readOnly="readonly">
                            <span class="input-group-btn">
                                <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
                            </span>
                            <span class="input-group-btn">
                                <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
                            </span>
                        </div>
                    </div>
                    
                    <label class="control-label col-md-1" for="inputWarning">经销商</label>
                    <div class="col-md-2">
                        <select name="dealerId" class="form-control">
                        	<option value="" selected="selected">==请选择==</option>
                        	<#if (dealerList?if_exists)>
	                        	<#list dealerList?sort_by('dealerName') as dealer>
	                        		<#if (dealer.dealerId==attrValue.dealerId)>
	                        			<option selected="selected" value="${dealer.dealerId}">${dealer.dealerName}</option>
	                        		<#else>
	                        			<option value="${dealer.dealerId}">${dealer.dealerName}</option>
	                        		</#if>
	                        	</#list>
                        	</#if>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-1" for="inputWarning">下单时间</label>
                    
                    <div class="col-md-4">
                        <div class="input-group date datetime">
                            <input name="createStartTime"  id="startTime1" value="${(attrValue.createStartTime)!''}" onchange="setTime2(this)" type="text" size="16" class="form-control" readOnly="readonly">
                            <span class="input-group-btn">
                                <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
                            </span>
                            <span class="input-group-btn">
                                <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group date datetime">
                            <input name="createEndTime"  id="endTime1" value="${(attrValue.createEndTime)!''}" onchange="setTime4(this)" type="text" size="16" class="form-control" readOnly="readonly">
                            <span class="input-group-btn">
                                <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
                            </span>
                            <span class="input-group-btn">
                                <button class="btn default date-set" type="button"><i class="icon-calendar"></i></button>
                            </span>
                        </div>
                    </div>
                    
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-2">
                    	<button class="btn blue" type="submit">查询</button>
                    </div>
                </div>
                <hr />
                <div class="dataTable">
                
                    <table class="table table-striped table-bordered table-hover margin-top-10" id="sampleStats">
                        <thead>
                            <tr>
                                <th>订单总数</th>
                                <th>经销商填写备注的订单数</th>
                                <th>接单数</th>
                                <th>拒单数</th>
                                <th>操作反选项目的订单数</th>
                                <th>用户点击已完成的订单数</th>
                                <th>完工后用户主动更新公里数的订单数</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${(resMap.totalCount)!0}</td>
                                <td>${(resMap.remarkCount)!0}</td>
                                <td>${(resMap.receiveCount)!0}</td>
                                <td>${(resMap.refuseCount)!0}</td>
                                <td>${(resMap.reverseCount)!0}</td>
                                <td>${(resMap.finishCount)!0}</td>
                                <td>${(resMap.judgeCount)!0}</td>
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
    </div>
  </div>
  </div>


<!-- END PAGE -->
<script>
   /**
         * Simplified Chinese translation for bootstrap-datepicker
         * Yuan Cheung <advanimal@gmail.com>
         */
        ;(function($){
            $.fn.datepicker.dates['zh-CN'] = {
                days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
                daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
                daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
                months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                today: "今日",
                format: "yyyy年mm月dd日",
                weekStart: 1
            };
        }(jQuery));
     
    jQuery(document).ready(function () {
      var tabName = ${tabName}+"";
      if(tabName=='2'){
      $("#od").click();
      }
        var myChart = echarts.init(document.getElementById('main'));
 		var option = {
                    tooltip: {
                        show: true,
                        textStyle: {
                            fontFamily: '微软雅黑'
                        }
                    },
                    legend: {
                        data:['激活量']
                    },
                    textStyle: {
                        fontFamily: '微软雅黑'
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data: [${data}]

                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    color:['#87cefa' ],
                    series : [
                        {
                            "name":"激活量",
                            "type":"bar",
                            "data":[${dataVal}]
                        } ,

                    ]
                };


        // 为echarts对象加载数据
             var _data_ = [${data}];
     if(_data_.length!=0){
        myChart.setOption(option);}
        App.init();
        //TableStats.init();
    
                $('.date-picker').datepicker({
            language: 'zh-CN',
            weekStart: 0,
            rtl: App.isRTL(),
            autoclose: true,
            format: "yyyy-mm-dd"
        });
		 $(".datetime").datetimepicker({
		    isRTL: App.isRTL(),
		    format: "yyyy-mm-dd hh:ii",
		    showMeridian: true,
		    autoclose: true,
		    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
		    todayBtn: true,
		    language: 'zh-CN'
		});
    });
    var _time1="0";
    var _time2="0";
    var _time3="0";
    var _time4="0";
    var _time5="0";
    var _time6="0";
         $(function(){
   
    if( $("#startTime").val()!==""){
    _time1 = $("#startTime").val().replace("-","/").replace("-","/");
    }
    if( $("#endTime").val()!==""){
    _time3 = $("#endTime").val().replace("-","/").replace("-","/");
    }
      if( $("#startTime1").val()!==""){
    _time2 = $("#startTime1").val().replace("-","/").replace("-","/");
    }
    if( $("#endTime1").val()!==""){
    _time4 = $("#endTime1").val().replace("-","/").replace("-","/");
    }   
    
     if( $("#createTimeStart").val()!==""){
    _time5 = $("#createTimeStart").val().replace("-","/").replace("-","/");
    }
    if( $("#createTimeEnd").val()!==""){
    _time6 = $("#createTimeEnd").val().replace("-","/").replace("-","/");
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
    
     function setTime5(o){
    if(o.value==""){
    _time5="0";
    }else{
    _time5 = o.value;
    }

    if(_time6!="0"){
    var startTime = new Date($(o).val().replace("-","/").replace("-","/")).getTime();
    var endTime = new Date( _time6.replace("-","/").replace("-","/")).getTime();
    if(endTime<=startTime){
    alert("开始时间不可以大于结束时间", 'error');

    $(o).val("");
    }
    }

    }
        function setTime6(o){
    if(o.value==""){
    _time6="0";
    }else{
    _time6 = o.value;
    }
    if(_time5!="0"){
    var startTime = new Date( _time5.replace("-","/").replace("-","/")).getTime();
    var endTime = new Date( $(o).val().replace("-","/").replace("-","/")).getTime();
    if(endTime<=startTime){
    alert("结束时间不可以小于开始时间", 'error');
    $(o).val("");
    }
    }
    }
    

        function res(id){
   
    $("#"+id).val("");
    }
    
</script>