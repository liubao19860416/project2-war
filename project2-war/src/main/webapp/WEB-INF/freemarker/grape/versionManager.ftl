 <!-- BEGIN PAGE -->
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">版本管理</h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="index.html">主页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li><a href="#">版本管理</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
            <div class="portlet box blue" id="dealerQuery">
                <div class="portlet-title">
                    <div class="caption">版本管理</div>
                </div>
                <div class="portlet-body version form-horizontal">
                    <div class="media-body">
                        <div class="media">
                            <h3 class="media-heading clearfix">
                                <a class="pull-left" href="#">
                                    <img class="media-object" width="30" height="35" src="${request.contextPath}/grape/assets/img/u59.jpg" />
                                </a>
                                <span>&nbsp;Android车主</span>
                                <button data-toggle="modal" data-target="#versionUpdataAndService"  class="btn blue pull-right">更新</button>
                            </h3>
                            <div class="media-body">
                                <h4 class="media-heading">最新版本号：
                                <p id="andVersionService">
                                   		${versionManagerVoAndService.version}
                                </p>
                                </h4>
                                <h4 class="media-heading">更新内容</h4>
                                <p  id="andContentService">
                                	
                                    	 ${versionManagerVoAndService.content}
                                  	
                                </p>
                            </div>
                        </div>
                         <div class="media">
                            <h3 class="media-heading clearfix">
                                <a class="pull-left" href="#">
                                    <img class="media-object" width="30" height="35" src="${request.contextPath}/grape/assets/img/u59.jpg" />
                                </a>
                                <span>&nbsp;Android经销商</span>
                                <button data-toggle="modal" data-target="#versionUpdataAndDop"  class="btn blue pull-right">更新</button>
                            </h3>
                            <div class="media-body">
                                <h4 class="media-heading">最新版本号：
                                <p id="andVersionDop">
                                ${versionManagerVoAndDop.version}
                                </p>
                                </h4>
                                <h4 class="media-heading">更新内容</h4>
                                <p  id="andContentDop">
                                     	${versionManagerVoAndDop.content}
                                </p>
                            </div>
                        </div>
                        <div class="media">
                            <h3 class="media-heading clearfix">
                                <a class="pull-left" href="#">
                                    <img class="media-object" width="25" height="30" src="${request.contextPath}/grape/assets/img/u57.png" />
                                </a>
                                <span>&nbsp;IOS车主</span>
                                <button data-toggle="modal" data-target="#versionUpdataIosService" class="btn blue pull-right">更新</button>
                            </h3>
                            <div class="media-body">
                                <h4 class="media-heading">最新版本号：
                                <p id="iosVersion">
	                                	${versionManagerVoIosService.version}
                                </p>
                                </h4>
                                <h4 class="media-heading">更新内容</h4>
                                <p id="iosContent">
                                   	 ${versionManagerVoIosService.content}
                                </p>
                            </div>
                        </div>
                        
                    </div>
                   
                </div>
            </div>
            <!-- END PAGE HEADER-->
        </div>
        <!-- END FOOTER -->
    <div class="modal fade" id="versionUpdataAndService"  tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog modal-wide">
            <div class="modal-content well form-horizontal version">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">版本更新</h4>
                </div>
                <div class="modal-body">
                    <div class="media">
                        <h3 class="media-heading clearfix margin-bottom-20">
                            <a class="pull-left" href="#">
                                <img class="media-object" width="25" height="30" src="${request.contextPath}/grape/assets/img/u59.jpg" />
                            </a>
                            <span>&nbsp;Android车主</span>
                        </h3>
                        <div class="media-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">版本号</label>
                                <div class="col-md-10">
                                    <input type="text" id="versionAndService" name="versionAndService" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">更新内容</label>
                                <div class="col-md-10">
                                    <textarea id="contentAndService" name="contentAndService" class="form-control" style="height:80px;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn default" data-dismiss="modal" id="clickEventAndService" aria-hidden="true">关闭</button>
                    <button class="btn blue" onclick="saveWindowAndService()">提交</button>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="modal fade" id="versionUpdataAndDop"  tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog modal-wide">
            <div class="modal-content well form-horizontal version">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">版本更新</h4>
                </div>
                <div class="modal-body">
                    <div class="media">
                        <h3 class="media-heading clearfix margin-bottom-20">
                            <a class="pull-left" href="#">
                                <img class="media-object" width="25" height="30" src="${request.contextPath}/grape/assets/img/u59.jpg" />
                            </a>
                            <span>&nbsp;Android经销商</span>
                        </h3>
                        <div class="media-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">版本号</label>
                                <div class="col-md-10">
                                    <input type="text" id="versionAndDop" name="versionAndDop" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">更新内容</label>
                                <div class="col-md-10">
                                    <textarea id="contentAndDop" name="contentAndDop" class="form-control" style="height:80px;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn default" data-dismiss="modal" id="clickEventAndDop" aria-hidden="true">关闭</button>
                    <button class="btn blue" onclick="saveWindowAndDop()">提交</button>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="modal fade" id="versionUpdataIosService"  tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog modal-wide">
            <div class="modal-content well form-horizontal version">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">版本更新</h4>
                </div>
                <div class="modal-body">
                    <div class="media">
                        <h3 class="media-heading clearfix margin-bottom-20">
                            <a class="pull-left" href="#">
                                <img class="media-object" width="25" height="30" src="${request.contextPath}/grape/assets/img/u57.png" />
                            </a>
                            <span>&nbsp;IOS车主</span>
                        </h3>
                        <div class="media-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">版本号</label>
                                <div class="col-md-10">
                                    <input type="text" id="versionIos" name="versionIos" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">更新内容</label>
                                <div class="col-md-10">
                                    <textarea id="contentIos" name="contentIos" class="form-control" style="height:80px;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn default" data-dismiss="modal" id="clickEventIosService" aria-hidden="true">关闭</button>
                    <button class="btn blue" onclick="saveWindowIos()">提交</button>
                </div>
            </div>
        </div>
    </div>
    
       <script>
       //车主android
        function saveWindowAndService(){
	        var versionAndService = $("#versionAndService").val();
	        var contentAndService = $("#contentAndService").val();
	        if(versionAndService==""||versionAndService==null){
	            alert("版本号不能为空!");
	        }else if(contentAndService==""||contentAndService==null){
	            alert("更新内容不能为空!");
	        }else{
	            $.ajax({
                                "type": "POST",
                                "url": "saveVersionManager.htm",
                                "data":{
	                                "content":contentAndService,
	                                "version":versionAndService,
	                                "plateformType":"1000",//代表android
	                                "appName":"GrapeToC"//代表车主
                                },
                                "dataType":"json",
                                "contentType":"application/x-www-form-urlencoded",
                                "success": function(data) {
                                	var info = eval(data);
                                	if(info.result==1){//更新成功
                                		$('#andVersionService').html(info.version);
                                		$('#andContentService').html(info.content);
                                		alert("更新成功!");
                                		//触发click关闭事件
                                		$('#clickEventAndService').click();
                                	}else{
                                		alert("更新失败!");
                                	}
                                },
                                "error": function(data) {
                                	alert("更新失败!");
                                 }
                              });
	        }
	        			
        }
        
        //经销商android
        function saveWindowAndDop(){ 
	        var versionAndDop = $("#versionAndDop").val();
	        var contentAndDop = $("#contentAndDop").val();
	        if(versionAndDop==""||versionAndDop==null){
	            alert("版本号不能为空!");
	        }else if(contentAndDop==""||contentAndDop==null){
	            alert("更新内容不能为空!");
	        }else{
	        			$.ajax({
                                "type": "POST",
                                "url": "saveVersionManager.htm",
                                "data":{
	                                "content":contentAndDop,
	                                "version":versionAndDop,
	                                "plateformType":"1000",//代表android
	                                "appName":"GrapeToB"//代表经销商
                                },
                                "dataType":"json",
                                "contentType":"application/x-www-form-urlencoded",
                                "success": function(data) {
                                	var info = eval(data);
                                	if(info.result==1){//更新成功
                                		$('#andVersionDop').html(info.version);
                                		$('#andContentDop').html(info.content);
                                		alert("更新成功!");
                                		//触发click关闭事件
                                		$('#clickEventAndDop').click();
                                	}else{
                                		alert("更新失败!");
                                	}
                                },
                                "error": function(data) {
                                	alert("更新失败!");
                                 }
                              });
                        }
        }
        //车主ios
        function saveWindowIos(){
         	var versionIos = $("#versionIos").val();
	        var contentIos = $("#contentIos").val();
	        if(versionIos==""||versionIos==null){
	            alert("版本号不能为空!");
	        }else if(contentIos==""||contentIos==null){
	            alert("更新内容不能为空!");
	        }else{
	        			$.ajax({
                                "type": "POST",
                                "url": "saveVersionManager.htm",
                                "data":{
	                                "content":contentIos,
	                                "version":versionIos,
	                                "plateformType":"2000",//代表ios
	                                "appName":"GrapeToC"//代表车主
                                },
                                "dataType":"json",
                                "contentType":"application/x-www-form-urlencoded",
                                "success": function(data) {
                                	var info = eval(data);
                                	if(info.result==1){//更新成功
                                		$('#iosVersion').html(info.version);
                                		$('#iosContent').html(info.content);
                                		alert("更新成功!");
                                		//触发click关闭事件
                                		$('#clickEventIosService').click();
                                	}else{
                                		alert("更新失败!");
                                	}
                                },
                                "error": function(data) {
                                	alert("更新失败!");
                                 }
                              });
                      }
        }
    </script>