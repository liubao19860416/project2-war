   
      
<link href='${request.contextPath}/grape/assets/plugins/selectable/css/fullcalendar.css' rel='stylesheet' />
<link href='${request.contextPath}/grape/assets/plugins/selectable/css/tip-darkgray/tip-darkgray.css' rel='stylesheet' />
<link href='${request.contextPath}/grape/assets/plugins/selectable/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="${request.contextPath}/grape/assets/plugins/selectable/css/flick/jquery-ui-1.10.4.custom.css">

<script src='${request.contextPath}/grape/assets/plugins/selectable/js/moment.min.js'></script>
<script src='${request.contextPath}/grape/assets/plugins/selectable/js/jquery-1.8.0.min.js'></script>
<script src="${request.contextPath}/grape/assets/plugins/selectable/js/YYFMap.js"></script>
<script src="${request.contextPath}/grape/assets/plugins/selectable/js/jquery-ui-1.10.4.custom.js"></script>
<script src='${request.contextPath}/grape/assets/plugins/selectable/js/jquery.poshytip.js'></script>
<script src='${request.contextPath}/grape/assets/plugins/selectable/js/fullcalendar.js'></script>
<script src='${request.contextPath}/grape/assets/plugins/selectable/js/jquery-ui-timepicker-addon.js'></script>
 <script src="${request.contextPath}/grape/assets/plugins/selectable/js/main.time.js"></script>

 <script src='${request.contextPath}/grape/assets/plugins/selectable/js/lang-all.js'></script> 
 <script>
 var dealerId;
 </script> 
 
    <style>
    	.table { width:98%;max-width:none; margin-left:10px;} .table .table { margin: 0; }
        .table-bordered > tbody > tr td { border-right:0;vertical-align:middle;} 
        .table-bordered > tbody > tr > .child-td { padding: 0; border-left: 0; border-right: 0;width:300px; }
        .table .child-td td { border-left:1px solid #ddd;text-align:right;} 
        .table .child-td tr:first-child td { border-top: 0; }
    </style>
    <!-- BEGIN PAGE -->
    
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">商品管理</h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="index.html">主页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li><a href="#">商品管理</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
            <div class="portlet box blue"id="dealerQuery">
                <div class="portlet-title">
                    <div class="caption">商品管理</div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="#" class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-1" for="inputWarning">经销商</label>
                                <div class="col-md-3">
                                    <input id="dealerName" type="text" class="form-control">
                                </div>
                                <div class="col-md-3">
                                    <div class="btn blue" onclick='checkByName("query")' id="views_check">查询</div>
                                </div>
                           
             
                    </form>
                    
                    <!-- END FORM-->
                       </div>
                                      <div class="dataTable" >
                                <table class="table table-striped table-bordered table-hover" id="ShopQuery">
                                    <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>经销商名称</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="ShopQuerytbody">
                                  
                                     
                                     
                                    </tbody>
                                     </table>
                            
                            <div style="float:right; margin-right:20px">
                              <div class="btn blue" onclick="prevPage()" >上一页</div>
                                <div class="btn blue" onclick="nextPage()">下一页</div>
                                <div>
                                <br />
                        </div>
                        </div>
            </div>
            
            <div class="portlet box blue"  >
                <div class="portlet-title">
                    <div class="caption"><span id="dealers">经销商详情</span></div>
                    <div class="tools" style="margin:0;">
                      
                    </div>
                </div>
                <div class="portlet-body form-body">
                    <div style="float: right ;">
					 <div  id="pre" class="btn">上一周</div>
					 <div  id="next" class="btn btn-primary">下一周</div>  </div>
					<div id='calendar' style="font-family:'微软雅黑';"  id="detf"></div>   </td>
                          
                </div>
            </div>
            <!-- END PAGE HEADER-->
        </div>
        <!-- END PAGE -->
    </div>
        
        
        <script>
        
        jQuery(document).ready(function () {
           checkByName();
            App.init();
            //ShopQuery.init();
            $("select.form-control").select2();
            $('.date-picker').datepicker({
                rtl: App.isRTL(),
                autoclose: true
            });
          
         
          
        });
    </script> 
    
    <script>
    var pageCount=1;
    var pageIndex =1;
    var pageSize =3;
  
       function queryMdseDsDetail(varDealerId,dealerName){
      
          
              $("#dealers").text(dealerName);
            dealerId = varDealerId;
            init();
            
            }
            
         
            
            function checkByName(){
            pageCount=1;
   			pageIndex =1;
 
         	   var formdata = {
         	   dealerName:$("#dealerName").val(),
         	   pageIndex:arguments.length>0?1:pageIndex,
         	   pageSize:pageSize
         	   };
		   
           $.ajax({
                    type: "POST",
                    url: "showMdseManagerReturnJson.json",
                    data:JSON.stringify(formdata),
                    dataType:"json",
                    contentType:"application/json",
                    success:function(data) {
                        var dealerList = data.dealerList;
                        pageCount=parseInt((data.count*1+2)/3); 
                        console.log(data);
                        var html;
                         $('#ShopQuerytbody').empty();
						for(var i=0; i<dealerList.length; i++){
                          var no = (pageIndex-1)*pageSize;
						   no = no+i+1;
						 html=html+ "<tr> <td>"+no+"</td><td>"+dealerList[i].dealerName+"</td><td><a href='#' class='btn btn-xs blue' onclick=queryMdseDsDetail('"+dealerList[i].dealerId+"','"+dealerList[i].dealerName+"')>查看</a></td></tr>"
						}
						 $('#ShopQuerytbody').append(html);
                    },
                    error:function(error){
                  
                        
                    }
                });
            }

            function checkByNamePageNo(){
           
         	   var formdata = {
         	   dealerName:$("#dealerName").val(),
         	   pageIndex:arguments.length>0?1:pageIndex,
         	   pageSize:pageSize
         	   };
		   
           $.ajax({
                    type: "POST",
                    url: "showMdseManagerReturnJson.json",
                    data:JSON.stringify(formdata),
                    dataType:"json",
                    contentType:"application/json",
                    success:function(data) {
                        var dealerList = data.dealerList;
                        pageCount=parseInt((data.count*1+2)/3); 
                        console.log(data);
                        var html;
                         $('#ShopQuerytbody').empty();
						for(var i=0; i<dealerList.length; i++){
                          var no = (pageIndex-1)*pageSize;
						   no = no+i+1;
						 html=html+ "<tr> <td>"+no+"</td><td>"+dealerList[i].dealerName+"</td><td><a href='#' class='btn btn-xs blue' onclick=queryMdseDsDetail('"+dealerList[i].dealerId+"','"+dealerList[i].dealerName+"')>查看</a></td></tr>"
						}
						 $('#ShopQuerytbody').append(html);
                    },
                    error:function(error){
                  
                        
                    }
                });
            }
                 
      function prevPage(){
      if(pageIndex==1){
      alert("现在是第一页")
      }else{
      pageIndex = pageIndex-1;
       checkByNamePageNo();
      }
    }
    
    function nextPage(){
        if(pageIndex==pageCount){
      alert("现在是最后一页")
      }else{
      pageIndex = pageIndex+1;
    
       checkByNamePageNo();
      }
    }

	 
   
    
    </script>