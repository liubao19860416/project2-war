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
<!-- BEGIN PAGE -->
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
    <h3 class="page-title">意见反馈</h3>
    <ul class="page-breadcrumb breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">主页</a>
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">意见反馈</a></li>
    </ul>
    <!-- END PAGE TITLE & BREADCRUMB-->
  <div class="bs-example bs-example-tabs">
        <ul id="myTab" class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#user" role="tab" data-toggle="tab">用户意见</a></li>
            <li><a href="#delar" role="tab" data-toggle="tab">经销商意见</a></li>

        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="user">
             <div class="portlet box "id="dealerQuery">
   
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form  method="post" id="feedForm" class="form-horizontal">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-1" for="inputWarning">发送时间</label>
                        <div class="col-md-4">
                            <div class="input-group date datetime" data-date="">
                                <input type="text" size="16" class="form-control" name="startTime" id="startTime" onchange="setTime1(this)" value=""  readOnly="readonly">
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
                                <input type="text" size="16" class="form-control" name="endTime" id="endTime" value="" onchange="setTime3(this)"  readOnly="readonly">
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
                        <div class="col-md-3">

                            <span class="btn blue" onclick="queryFeedAjax()">查询</span>&nbsp;&nbsp;
                        </div>
                    </div>
                    <hr />
                    <div class="dataTable">
                        <!-- 每页显示多少条 -->
                        <div>
                            <label>每页显示</label>
                            <select  name="pageSize" id="pageSize" value="${pageSize}" onchange="queryFeedAjax()">
                                <option value="10">10</option>
                                <option value="15" >15</option>
                                <option value="20">20</option>
                            </select>
                            <label>条记录</label>
                        </div>
                        <!-- 每页显示多少条 -->
                        <table class="table table-striped table-bordered table-hover margin-top-10" id="UserAdvice">
                            <thead>
                            <tr>
                                <th width="15%">序号</th>
                                <th width="20%">时间</th>
                                <th width="20%">用户手机号</th>
                                <th width="55%">意见内容</th>
                            </tr>
                            </thead>
                            <tbody id="content">


                            </tbody>
                        </table>
                        <!-- 分页样式 -->
                        <div class="row-fluid" style="margin-top:10px;">
                            <div class="span5">从<span id="pageIndex"></span>页到<span id="pageTotal"></span>页/共<span id="rowsTotal"></span>条数据</div>
                            <div class="span7">
                                <div id="Pagination" class="pagination" style="float: right"> </div>
                            </div>
                        </div>
                        <br/>
                        <!-- 分页样式 -->
                    </div>
                </div>
            </form>
            <!-- END FORM-->
        </div>
    </div>
            </div>
            <div class="tab-pane fade" id="delar">
             <form  method="post" id="delarForm" class="form-horizontal">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-1" for="inputWarning">发送时间</label>
                        <div class="col-md-4">
                            <div class="input-group date datetime" data-date="">
                                <input type="text" size="16" class="form-control" name="startTime" id="dealerStartTime" onchange="setTime2(this)" value=""  readOnly="readonly">
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
                                <input type="text" size="16" class="form-control" name="endTime" id="dealerEndTime" value="" onchange="setTime4(this)"  readOnly="readonly">
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
                        <div class="col-md-3">

                            <span class="btn blue" onclick="delarqueryFeedAjax()">查询</span>&nbsp;&nbsp;
                        </div>
                    </div>
                    <hr />
                    <div class="dataTable">
                        <!-- 每页显示多少条 -->
                        <div>
                            <label>每页显示</label>
                            <select  name="delarpageSize" id="dealerPageSize" value="" onchange="delarqueryFeedAjax()">
                                <option value="10">10</option>
                                <option value="15" >15</option>
                                <option value="20">20</option>
                            </select>
                            <label>条记录</label>
                        </div>
                        <!-- 每页显示多少条 -->
                        <table class="table table-striped table-bordered table-hover margin-top-10" id="DelarAdvice">
                            <thead>
                            <tr>
                                <th width="15%">序号</th>
                                <th width="20%">时间</th>
                                <th width="20%">经销商名称</th>
                                <th width="55%">意见内容</th>
                            </tr>
                            </thead>
                            <tbody id="delarcontent">


                            </tbody>
                        </table>
                        <!-- 分页样式 -->
                        <div class="row-fluid" style="margin-top:10px;">
                            <div class="span5">从<span id="delarpageIndex"></span>页到<span id="delarpageTotal"></span>页/共<span id="delarrowsTotal"></span>条数据</div>
                            <div class="span7">
                                <div id="delarPagination" class="pagination" style="float: right"> </div>
                            </div>
                        </div>
                        <br/>
                        <!-- 分页样式 -->
                    </div>
                </div>
            </form>
            </div>

        </div>
    </div>
  </div>
      <script>
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
        
        
        var pageNo = 1;
        var pageSize =10;
         var dealerPageNo = 1;
        var dealerPageSize =10;
        
        
       function pageselectCallback(page_index, jq){
        pageNo = page_index+1;
       init();
       // inits(pageSize);

    }
         function pageselectCallbackForDealer(page_index, jq){
        dealerPageNo = page_index+1;
       dealerInit();
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
        function getOptionsFromFormDealer(){
        var opt = {callback: pageselectCallbackForDealer};
        // Collect options from the text fields - the fields are named like their option counterparts
      
        opt.items_per_page=$("#dealerPageSize").val();
        opt.num_display_entries=5;
        opt.num_edge_entries=0;
        opt.prev_text = "上一页";
        opt.next_text = "下一页";
        return opt;
    }
    
    
      function queryFeedAjax(){
       pageSize =$("#pageSize").val(); 
     var  param={
           startTime:$("#startTime").val(),
           endTime:$("#endTime").val(),
           pageIndex:pageNo,
           pageSize:pageSize
      }
      console.log(JSON.stringify(param))
      $.ajax({
					   type: "POST",
					   url: "feedBackListForAjax.json",
					   data: JSON.stringify(param),
					   dataType:"json",
					   "contentType":"application/json",
					   "success": function(data){
				   var  rowCount = data.count;
             var optInit = getOptionsFromForm();
             $("#Pagination").pagination(rowCount, optInit);
             $('#pageIndex').text(pageNo);
					   
					   }
					   
					   
					   });
      
      }
      
      
      
      
      
         function delarqueryFeedAjax(){
       dealerPageSize =$("#dealerPageSize").val(); 
     var  param={
           startTime:$("#dealerStartTime").val(),
           endTime:$("#dealerEndTime").val(),
           pageIndex:dealerPageNo,
           pageSize:dealerPageSize
      }
      console.log(JSON.stringify(param))
      $.ajax({
					   type: "POST",
					   url: "dealerFeedBackListForAjax.json",
					   data: JSON.stringify(param),
					   dataType:"json",
					   "contentType":"application/json",
					   "success": function(data){
				   var  rowCount = data.count;
             var optInit = getOptionsFromFormDealer();
             $("#delarPagination").pagination(rowCount, optInit);
             $('#delarpageIndex').text(dealerPageNo);
					   
					   }
					   
					   
					   });
      
      }
      
      
      
      
      
      
            function init(){
  
     var  param={
           startTime:$("#startTime").val(),
           endTime:$("#endTime").val(),
          pageIndex:pageNo,
           pageSize:pageSize
      }
      console.log(JSON.stringify(param))
      $.ajax({
					   type: "POST",
					   url: "feedBackListForAjax.json",
					   data: JSON.stringify(param),
					   dataType:"json",
					   "contentType":"application/json",
					   "success": function(data){
				   var  rowCount = data.count;
          
             $('#pageIndex').text(pageNo);
             var tmp = parseInt(rowCount / pageSize) + parseInt((rowCount % pageSize) > 0 ? 1 : 0);
             $('#pageTotal').text(tmp==0?1:tmp);
             $('#rowsTotal').text(rowCount);
             var html = '';
				for(var i  = 0 ; i < data.list.length; i++){
				    
				     html+="  <tr><td>"+( (pageNo-1)*pageSize+i+1)+"</td>";
				     html+="  <td>"+data.list[i].createTime+"</td>";
				     html+="  <td>"+data.list[i].mobilePhone+"</td>";
				     html+="  <td><xmp>"+data.list[i].feedBackContent+"</xmp></td> </tr>";
                     
				}
			
				  $("#content").empty();
             $("#content").append(html);
					   }
					   
					   
					   });
					   
					   

					   
					   
					   
					   
					   
					   
					   
					   
					   
					   
					   
					   
      
      }
      
      function dealerInit(){
      					   
					   
					   
					   var  param={
           startTime:$("#dealerStartTime").val(),
           endTime:$("#dealerEndTime").val(),
          pageIndex:dealerPageNo,
           pageSize:dealerPageSize
      } 
					   
					   
					   
					    $.ajax({
					   type: "POST",
					   url: "dealerFeedBackListForAjax.json",
					   data: JSON.stringify(param),
					   dataType:"json",
					   "contentType":"application/json",
					   "success": function(data){
				   var  rowCount = data.count;
          
             $('#delarpageIndex').text(dealerPageNo);
             var tmp = parseInt(rowCount / dealerPageSize) + parseInt((rowCount % dealerPageSize) > 0 ? 1 : 0);
             $('#delarpageTotal').text(tmp==0?1:tmp);
             $('#delarrowsTotal').text(rowCount);
             var html = '';
				for(var i  = 0 ; i < data.list.length; i++){
				    
				     html+="  <tr><td>"+( (pageNo-1)*pageSize+i+1)+"</td>";
				     html+="  <td>"+data.list[i].createTime+"</td>";
				     html+="  <td>"+data.list[i].dealerName+"</td>";
				     html+="  <td><xmp>"+data.list[i].feedBackContent+"</xmp></td> </tr>";
                     
				}
			
				  $("#delarcontent").empty();
             $("#delarcontent").append(html);
					   }
					   
					   
					   });
					   
					   
      }
      
      
	        jQuery(document).ready(function () {   
	           App.init();
	           $("select.form-control").select2;
	           $("select.form-control").select2();
			   $(".datetime").datetimepicker({
				    isRTL: App.isRTL(),
				    format: "yyyy-mm-dd hh:ii",
				    showMeridian: true,
				    autoclose: true,
				    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
				    todayBtn: true,
				    language: 'zh-CN'
				});
				
				
				
	           queryFeedAjax();
		        
		       delarqueryFeedAjax();
		        
		        
		        
		        $('.date-picker').datepicker({
		            rtl: App.isRTL(),
		            autoclose: true
		        }); 
	        });
    </script>
     <script >
			   function prevPage(){
				    var pageIndex= $('#pageIndex').val();
				    if(pageIndex==1){//等于第一页返回不调用后台
				       alert("当前页已是首页!");
				       return;
				    }
				    var prevPage = parseInt(pageIndex)-1;
				    $('#pageIndex').val(prevPage);
				    $("#feedForm").submit();
			   }
			   function nextPage(){
			    var pageIndex= $('#pageIndex').val();//当前页码
			    var pageTotal= $('#pageTotal').val();//总页数
			    var addPage = parseInt(pageIndex)+1;
			    if(addPage>pageTotal){//大于总页数返回不调用后台
			    	alert("当前页已是最后一页!");
			    	return;
			    }
			    $('#pageIndex').val(addPage);
			    $("#feedForm").submit();
			   }
			   
			  function changePageSize(){
			    $('#pageIndex').val(1);
			  	$("#feedForm").submit();
			  }
			  function queryFeed(){
				  	$("#feedForm").submit();
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