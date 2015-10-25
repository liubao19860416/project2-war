       <!-- BEGIN PAGE -->
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">消息群发</h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="index.html">主页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li><a href="#">消息群发</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
            <div class="portlet box blue" id="dealerQuery">
                <div class="portlet-title">
                    <div class="caption">消息群发</div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="${request.contextPath}/grape/message/pushPubMsg.htm" method="post" class="form-horizontal" id="from1">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-1">消息内容</label>
                                <div class="col-md-11">
                                    <textarea class="form-control" style="height:130px;" name="content" maxlength="50"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 text-right">
                                <!--
                                    <button data-toggle="modal" data-target="#mesGroup" class="btn blue">定时发送</button> -->
                                    <button data-toggle="modal" data-target="#sectips" class="btn blue" onClick="document.getElementById('from1').submit();">发送</button>
                                </div>
                            </div>
                            <hr />
                            <div class="dataTable">
                                <!-- 每页显示多少条 -->
                                <div>
                                    <label>每页显示</label>
                                    <select size="1" name="rowCount" id="rowCount" onchange="pageSizeChange()">
                                        <option value="5" selected="selected">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>                           
                                    </select>
                                    <label>条记录</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label>
                                        当前第<span id="pageIndex" style="color:blue">&nbsp;${pageIndex}&nbsp;</span>页</span>&nbsp;&nbsp;<span>共<span id="pageCount" style="color:blue">&nbsp;${totalPage}&nbsp;</span>页
                                        <input type="hidden"  value="1" name="pageIndex" id="hiddenpageIndex">
                                	</label>
                                </div>
                                <!-- 每页显示多少条 -->
                                <table class="table table-striped table-bordered table-hover margin-top-10" id="MesGroup">
                                    <thead>
                                        <tr>
                                            <th>发送时间</th>
                                            <th>消息内容</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <#if (notificationPublics?if_exists)>
                                        <#list notificationPublics as notificationPublic>
                                        <tr>
                                             <td>${notificationPublic.createTime}</td>
                                            <td>${notificationPublic.content}</td>
                                        </tr>
                                        </#list>
                                        </#if>
                                    </tbody>
                                </table>
                                  <!-- 分页样式 -->
                                <div class="row">
                                <div class="col-md-8">
                                </div>
                                    <div class="col-md-4">
                                        <div class="dataTables_paginate paging_bootstrap pull-right" >
                                            <ul class="pagination">
                                                <li class="prev"><a href="javascript:void(0)" title="前一页" onclick="firstPage()"><i class="icon-angle-left"></i></a></li>
                                                <li class="next"><a href="javascript:void(0)" title="后一页" onclick="nextPage()"><i class="icon-angle-right"></i></a></li>
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
<script>
	<!-- 改变pageSize-->
    function pageSizeChange(){
    	var pageIndex= $('#pageIndex').text().trim();
    	var pageSize=$("#rowCount  option:selected").text();
   		location.href="${request.contextPath}/grape/message/getPubMsgList.htm?pageIndex="+pageIndex+"&pageSize="+pageSize;
    }
    <!-- 点击上一页-->
   function firstPage(){
    	var pageIndex= $('#pageIndex').text();
   		if(parseInt(pageIndex)<=1){
    		alert("已经是第一页");
   	 	return;
    }
    	pageIndex--;
    	var pageSize=$("#rowCount  option:selected").text();
   		location.href="${request.contextPath}/grape/message/getPubMsgList.htm?pageIndex="+pageIndex+"&pageSize="+pageSize;
   }
   <!-- 点击下一页 -->
   function nextPage(){
    	var pageIndex= $('#pageIndex').text();
   		var pageCount= $('#pageCount').text();
    	if(parseInt(pageIndex) >= parseInt(pageCount)){
    	alert("已经是最后一页");
    	return;
    }
   	 	pageIndex++;
    	var pageSize=$("#rowCount  option:selected").text();
   		location.href="${request.contextPath}/grape/message/getPubMsgList.htm?pageIndex="+pageIndex+"&pageSize="+pageSize;
   }
   
  jQuery(document).ready(function () {
    $('#rowCount').val(${pageSize});
 });
</script>    
