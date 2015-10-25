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

    </style>

    <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">保养券查询</h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="index.html">主页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li><a href="#">保养券查询</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
            <div class="portlet box blue" id="dealerQuery">
                <div class="portlet-title">
                    <div class="caption">保养券查询</div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="#" class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-2">券号</label>
                                <div class="col-md-2">
                                    <input id="couponNo" type="text" class="form-control" value="" >
                                </div>
                                <label class="control-label col-md-4">发放人手机号</label>
                                <div class="col-md-3">
                                    <input id="mobile" maxlength="11" type="text" class="form-control" value="" >
                                </div>



                              <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2"> 保养券状态</label>
                                <div class="col-md-2">
                                    <select id="couponStatus" class="form-control">
                                        <option value="">==请选择==</option>
                                        <option value="2">已发放</option>
                                        <option value="3">已使用</option>
                                        <option value="4">已结算</option>
                                    </select>

                                </div>
                                <label class="control-label col-md-4">订单号</label>
                                <div class="col-md-3">
                                    <input id="orderNo" type="text" class="form-control" value="" >
                                </div>
                            </div>
               <div class="form-group">
                                <label class="control-label col-md-2"> 车牌号</label>
                                <div class="col-md-2">
                                       <input id="vlp" type="text" class="form-control" value="" >

                                </div>
                               
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2"> 开始日期</label>
                                <div class="col-md-5">
                                    <div class="input-group date-picker input-daterange" data-date="10/11/2012" data-date-format="yyyy-mm-dd">
                                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart"> 
                                         <span class="input-group-btn" onclick="res('createTimeStart')">
	                            <button class="btn default date-reset" type="button"><i  class="icon-remove"></i></button>
	                                 </span>
                                     &nbsp; <span class="input-group-addon">至</span>
                                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd">
                                        <span class="input-group-btn" onclick="res('createTimeEnd')">
	                            <button class="btn default date-reset" type="button"><i class="icon-remove"></i></button>
	                                 </span>
                                    </div>

                                </div>

                                <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2"> 截止日期</label>
                                <div class="col-md-5">
                                    <div class="input-group date-picker input-daterange" data-date="10/11/2012" data-date-format="yyyy-mm-dd">
                                        <input type="text" class="form-control" id="endTimeStart" name="endTimeStart">
                                         <span class="input-group-btn" onclick="res('endTimeStart')">
	                            <button class="btn default date-reset" type="button"><i  class="icon-remove"></i></button>
	                                 </span>
                                     &nbsp; 
                                        <span class="input-group-addon">至</span>
                                        <input type="text" class="form-control" id="endTimeEnd" name="endTimeEnd">
                                        <span class="input-group-btn" onclick="res('endTimeEnd')">
	                            <button class="btn default date-reset" type="button"><i  class="icon-remove"></i></button>
	                                 </span>
                                    </div>

                                </div>

                                <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2"> 使用日期</label>
                                <div class="col-md-5">
                                    <div class="input-group date-picker input-daterange" data-date="10/11/2012" data-date-format="yyyy-mm-dd">
                                        <input type="text" class="form-control" id="userTimeStart" name="userTimeStart">
                                                        <span class="input-group-btn" onclick="res('userTimeStart')">
	                            <button class="btn default date-reset" type="button"><i  class="icon-remove"></i></button>
	                                 </span>
                                     &nbsp; 
                                        <span class="input-group-addon">至</span>
                                        <input type="text" class="form-control" id="userTimeEnd" name="userTimeEnd">
                                                        <span class="input-group-btn" onclick="res('userTimeEnd')">
	                            <button class="btn default date-reset" type="button"><i  class="icon-remove"></i></button>
	                                 </span>
                                     
                                    </div>

                                </div>

                                <!--  <label class="radio-space"><input type="radio" name="m" /></label>-->
                            </div>
                            <div class="form-group">

                                 <div class="col-md-11">

                                 </div>
                                <div class="col-md-1">
                                    <button class="btn btn-primary" type="button" onclick="selectCoupon()">查询</button>
                                </div>

                            </div>
                             <hr />

                            <div class="form-group">
                                <label class="control-label col-md-1"> 每页显示</label>
                               

                                  <div class="col-md-1">
<select style="width:68px" id="pageSize" type="text" class="form-control" onchange="selectCoupon()">
                                        <option value="5" selected="selected">5 </option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>

                                    </select>
                                 </div>
                               	
                                <label class="control-label">条记录</label>

                            </div>

                             <div class="dataTable clearfix">
                             <div  style="width:100% ; overflow-x:auto">
                                 <table class="table table-bordered table-hover" style="width:2000px">
                                     <thead>
                                         <tr>
                                             <th>ID</th>
                                             <th>券号</th>
                                             <th  style="width:100px">车牌号</th>
                                             <th>金额</th>
                                             <th>发放人手机号</th>
                                             <th>订单号</th>
                                             <th>保养券状态</th>
                                             <th>开始日期</th>
                                             <th>截止日期</th>
                                             <th>使用日期</th>
                                             <th>品牌</th>
                                             <th>城市</th>
                                         </tr>
                                     </thead>
                                     <tbody id="couponContent">



                                     </tbody>
                                 </table>
</div>


                        <div class="row-fluid" style="margin-top:10px;">
                            <div class="span5">从<span id="pageIndex"></span>页到<span id="pageTotal"></span>页/共<span id="rowsTotal"></span>条数据</div>
                            <div class="span7">
                                <div id="Pagination" class="pagination" style="float: right"> </div>
                            </div>
                        </div>
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
    <script>
    
    Date.prototype.format = function(format){ 
var o = { 
"M+" : this.getMonth()+1, //month 
"d+" : this.getDate(), //day 
"h+" : this.getHours(), //hour 
"m+" : this.getMinutes(), //minute 
"s+" : this.getSeconds(), //second 
"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
"S" : this.getMilliseconds() //millisecond 
} 

if(/(y+)/.test(format)) { 
format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
} 

for(var k in o) { 
if(new RegExp("("+ k +")").test(format)) { 
format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
} 
} 
return format; 
} 
    
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
        /**
         * This jQuery plugin displays pagination links inside the selected elements.
         *
         * @author Gabriel Birke (birke *at* d-scribe *dot* de)
         * @version 1.2
         * @param {int} maxentries Number of entries to paginate
         * @param {Object} opts Several options (see README for documentation)
         * @return {Object} jQuery Object
         */
        jQuery.fn.pagination = function(maxentries, opts){
            opts = jQuery.extend({
                items_per_page:10,
                num_display_entries:10,
                current_page:0,
                num_edge_entries:0,
                link_to:"javascript:void(0);",
                prev_text:"Prev",
                next_text:"Next",
                ellipse_text:"...",
                prev_show_always:true,
                next_show_always:true,
                callback:function(){return false;}
            },opts||{});

            return this.each(function() {
                /**
                 * Calculate the maximum number of pages
                 */
                function numPages() {
                    return Math.ceil(maxentries/opts.items_per_page);
                }

                /**
                 * Calculate start and end point of pagination links depending on
                 * current_page and num_display_entries.
                 * @return {Array}
                 */
                function getInterval()  {
                    var ne_half = Math.ceil(opts.num_display_entries/2);
                    var np = numPages();
                    var upper_limit = np-opts.num_display_entries;
                    var start = current_page>ne_half?Math.max(Math.min(current_page-ne_half, upper_limit), 0):0;
                    var end = current_page>ne_half?Math.min(current_page+ne_half, np):Math.min(opts.num_display_entries, np);
                    return [start,end];
                }

                /**
                 * This is the event handling function for the pagination links.
                 * @param {int} page_id The new page number
                 */
                function pageSelected(page_id, evt){
                    current_page = page_id;
                    drawLinks();
                    var continuePropagation = opts.callback(page_id, panel);
                    if (!continuePropagation) {
                        if (evt.stopPropagation) {
                            evt.stopPropagation();
                        }
                        else {
                            evt.cancelBubble = true;
                        }
                    }
                    return continuePropagation;
                }

                /**
                 * This function inserts the pagination links into the container element
                 */
                function drawLinks() {
                    panel.empty();
                    var interval = getInterval();
                    var np = numPages();
                    // This helper function returns a handler function that calls pageSelected with the right page_id
                    var getClickHandler = function(page_id) {
                        return function(evt){ return pageSelected(page_id,evt); }
                    }
                    // Helper function for generating a single link (or a span tag if it's the current page)
                    var appendItem = function(page_id, appendopts){
                        page_id = page_id<0?0:(page_id<np?page_id:np-1); // Normalize page id to sane value
                        appendopts = jQuery.extend({text:page_id+1, classes:""}, appendopts||{});
                        if(page_id == current_page){
                            var lnk = jQuery("<span class='current'>"+(appendopts.text)+"</span>");
                        }
                        else
                        {
                            var lnk = jQuery("<a>"+(appendopts.text)+"</a>")
                                    .bind("click", getClickHandler(page_id))
                                    .attr('href', opts.link_to.replace(/__id__/,page_id));


                        }
                        if(appendopts.classes){lnk.addClass(appendopts.classes);}
                        panel.append(lnk);
                    }
                    // Generate "Previous"-Link
                    if(opts.prev_text && (current_page > 0 || opts.prev_show_always)){
                        appendItem(current_page-1,{text:opts.prev_text, classes:"prev"});
                    }
                    // Generate starting points
                    if (interval[0] > 0 && opts.num_edge_entries > 0)
                    {
                        var end = Math.min(opts.num_edge_entries, interval[0]);
                        for(var i=0; i<end; i++) {
                            appendItem(i);
                        }
                        if(opts.num_edge_entries < interval[0] && opts.ellipse_text)
                        {
                            jQuery("<span>"+opts.ellipse_text+"</span>").appendTo(panel);
                        }
                    }
                    // Generate interval links
                    for(var i=interval[0]; i<interval[1]; i++) {
                        appendItem(i);
                    }
                    // Generate ending points
                    if (interval[1] < np && opts.num_edge_entries > 0)
                    {
                        if(np-opts.num_edge_entries > interval[1]&& opts.ellipse_text)
                        {
                            jQuery("<span>"+opts.ellipse_text+"</span>").appendTo(panel);
                        }
                        var begin = Math.max(np-opts.num_edge_entries, interval[1]);
                        for(var i=begin; i<np; i++) {
                            appendItem(i);
                        }

                    }
                    // Generate "Next"-Link
                    if(opts.next_text && (current_page < np-1 || opts.next_show_always)){
                        appendItem(current_page+1,{text:opts.next_text, classes:"next"});
                    }
                }

                // Extract current_page from options
                var current_page = opts.current_page;
                // Create a sane value for maxentries and items_per_page
                maxentries = (!maxentries || maxentries < 0)?1:maxentries;
                opts.items_per_page = (!opts.items_per_page || opts.items_per_page < 0)?1:opts.items_per_page;
                // Store DOM element for easy access from all inner functions
                var panel = jQuery(this);
                // Attach control functions to the DOM element
                this.selectPage = function(page_id){ pageSelected(page_id);}
                this.prevPage = function(){
                    if (current_page > 0) {
                        pageSelected(current_page - 1);
                        return true;
                    }
                    else {
                        return false;
                    }
                }
                this.nextPage = function(){
                    if(current_page < numPages()-1) {
                        pageSelected(current_page+1);
                        return true;
                    }
                    else {
                        return false;
                    }
                }
                // When all initialisation is done, draw the links
                drawLinks();
                // call callback function
                opts.callback(current_page, this);
            });
        }

    </script>
<script>
    var pageNo = 1;
    var pageSize = 5;

    jQuery(document).ready(function () {
        $('.date-picker').datepicker({
            language: 'zh-CN',
            weekStart: 0,
            rtl: App.isRTL(),
            autoclose: true,
            format: "yyyy-mm-dd"
        });
        selectCoupon();
    });
    function pageselectCallback(page_index, jq){
        pageNo = page_index+1;
       init();
       // inits(pageSize);

    }
    function getOptionsFromForm(){
        var opt = {callback: pageselectCallback};
        // Collect options from the text fields - the fields are named like their option counterparts
      
        opt.items_per_page=$("#pageSize").val();
        opt.num_display_entries=5;
        opt.num_edge_entries=0;
        opt.prev_text = "上一页";
        opt.next_text = "下一页";
        return opt;
    }
    function checkMobile(){
        var sMobile = mobile=$("#mobile").val();
        if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))){
            alert("手机号不正确");

            return false;
        }
    }
    function init(){
     if($.trim($("#mobile").val())!=""){
            checkMobile();
        }
         pageSize = $("#pageSize").val();
 var param={};
     param.pageIndex=pageNo;
     param.pageSize=$("#pageSize").val();
     param.couponNo=$("#couponNo").val();
     param.mobile=$("#mobile").val();
     param.orderNo=$("#orderNo").val();
     param.couponStatus=$("#couponStatus").val();
     param.vlp=$("#vlp").val();
     param.createTimeStart= $.trim($("#createTimeStart").val())==""?$("#createTimeStart").val():$("#createTimeStart").val()+" 00:00:00";
     param.createTimeEnd= $.trim($("#createTimeEnd").val())==""?$("#createTimeEnd").val():$("#createTimeEnd").val()+" 23:59:59";
     param.endTimeStart=$.trim($("#endTimeStart").val())==""?$("#endTimeStart").val():$("#endTimeStart").val()+" 00:00:00";
     param.endTimeEnd= $.trim($("#endTimeEnd").val())==""?$("#endTimeEnd").val():$("#endTimeEnd").val()+" 23:59:59";
     param.userTimeStart=$.trim($("#userTimeStart").val())==""?$("#userTimeStart").val():$("#userTimeStart").val()+" 00:00:00";
     param.userTimeEnd= $.trim($("#userTimeEnd").val())==""?$("#userTimeEnd").val():$("#userTimeEnd").val()+" 23:59:59";
   console.log(JSON.stringify(param))

     $.ajax({
         "dataType": 'json',
         "type": "POST",
         "url":"getCouponListByPage/0.json",
         "data": JSON.stringify(param),
         "dataType": "json",
         "contentType": "application/json",
         "success": function(data) {
             console.log(data);
             var  rowCount = data.count;
          
             $('#pageIndex').text(pageNo);
             var tmp = parseInt(rowCount / pageSize) + parseInt((rowCount % pageSize) > 0 ? 1 : 0);
             $('#pageTotal').text(tmp==0?1:tmp);
             $('#rowsTotal').text(rowCount);
             var html = '';
           for(var i = 0 ; i < data.couponList.length; i++){
           
               html +="<tr>";
               html+="<td>"+data.couponList[i].couponId+"</td>";
               
               if((data.couponList[i].verifyCode+"")=="null"){
                  html+="<td>"+""+"</td>";
               }else{
               	  html+="<td>"+data.couponList[i].verifyCode+"</td>";
               }
               if((data.couponList[i].plateNumber+"")=="null"){
                  html+="<td>"+""+"</td>";
               }else{
               	  html+="<td>"+data.couponList[i].plateNumber+"</td>";
               }
               if((data.couponList[i].amount+"")=="null"){
                  	html+="<td>"+""+"</td>";
               }else{
               		html+="<td>"+data.couponList[i].amount+"</td>";
               }
              
              if(data.couponList[i].mobile==null){
               		html+="<td>"+""+"</td>";
              }else{
              		html+="<td>"+data.couponList[i].mobile+"</td>";
              }
               
              if(data.couponList[i].grapeOrderId==null){
               		html+="<td>"+""+"</td>";
              }else{
               		html+="<td>"+data.couponList[i].grapeOrderId+"</td>";
              }
              
               if(data.couponList[i].couponStatus=="2"){
                   html+="<td>已发放</td>";
               }
               if(data.couponList[i].couponStatus=="3"){
                   html+="<td>已使用</td>";
               }
               if(data.couponList[i].couponStatus=="4"){
                   html+="<td>已结算</td>";
               }
               html+="<td>"+new Date(data.couponList[i].createTime).format("yyyy-MM-dd hh:mm:ss") +"</td>";
                html+="<td>"+new Date(data.couponList[i].endTime).format("yyyy-MM-dd hh:mm:ss")+"</td>";
               if(data.couponList[i].useTime==null){
              
               html+="<td>未使用</td>";
               }else{
               
                html+="<td>"+new Date(data.couponList[i].useTime).format("yyyy-MM-dd hh:mm:ss")+"</td>";
               }
               
              if(data.couponList[i].strBrandName==null){
               		html+="<td>"+""+"</td>";
              }else{
               		html+="<td>"+data.couponList[i].strBrandName+"</td>";
              }
              if(data.couponList[i].strCityName==null){
               		html+="<td>"+""+"</td>";
              }else{
               		html+="<td>"+data.couponList[i].strCityName+"</td>";
              }
               
               html +="<tr>";
           }

      $("#couponContent").empty();
             $("#couponContent").append(html);


         }
     });
    }
    function res(id){
   
    $("#"+id).val("");
    }
    function selectCoupon(){
        if($.trim($("#mobile").val())!=""){
            checkMobile();
        }
        pageSize = $("#pageSize").val();
 var param={};
     param.pageIndex=pageNo;
     param.pageSize=$("#pageSize").val();
     param.couponNo=$("#couponNo").val();
     param.mobile=$("#mobile").val();
     param.orderNo=$("#orderNo").val();
     param.couponStatus=$("#couponStatus").val();
       param.vlp=$("#vlp").val();
     param.createTimeStart= $.trim($("#createTimeStart").val())==""?$("#createTimeStart").val():$("#createTimeStart").val()+" 00:00:00";
     param.createTimeEnd= $.trim($("#createTimeEnd").val())==""?$("#createTimeEnd").val():$("#createTimeEnd").val()+" 23:59:59";
     param.endTimeStart=$.trim($("#endTimeStart").val())==""?$("#endTimeStart").val():$("#endTimeStart").val()+" 00:00:00";
     param.endTimeEnd= $.trim($("#endTimeEnd").val())==""?$("#endTimeEnd").val():$("#endTimeEnd").val()+" 23:59:59";
     param.userTimeStart=$.trim($("#userTimeStart").val())==""?$("#userTimeStart").val():$("#userTimeStart").val()+" 00:00:00";
     param.userTimeEnd= $.trim($("#userTimeEnd").val())==""?$("#userTimeEnd").val():$("#userTimeEnd").val()+" 23:59:59";
   console.log(JSON.stringify(param))

     $.ajax({
         "dataType": 'json',
         "type": "POST",
         "url":"getCouponListByPage/0.json",
         "data": JSON.stringify(param),
         "dataType": "json",
         "contentType": "application/json",
         "success": function(data) {
             console.log(data);
             var  rowCount = data.count;
             var optInit = getOptionsFromForm();
             $("#Pagination").pagination(rowCount, optInit);
             $('#pageIndex').text(pageNo);
            
    
         }
     });
    }

</script>
