<input type="hidden" id="cscBasePath" value="${request.contextPath}" />
<div class="header navbar navbar-inverse navbar-fixed-top">
	<div class="header-inner">
		<a class="navbar-brand text-center"  href="${request.contextPath}/index.htm"><strong style="font-size:20px;color:#fff;font-family: 'Microsoft YaHei';">上汽电商运营平台
</strong></a>
		<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <img src="${request.contextPath}/assets/img/menu-toggler.png" alt="" /> </a>
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown user">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> 
					<img alt="" src="${request.contextPath}/assets/img/avatar1_small.jpg"/> <span class="username"><#if user?exists>${user.name}</#if></span> 
				</a>
				<ul class="dropdown-menu">
					<li>
						<a onclick="updatePasswordDaliog()"><i></i>修改密码</a>
					</li>
					<li>
						<a href="${request.contextPath}/logout"><i class="icon-user"></i>退出</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<div class="clearfix"></div>
<div class="modal fade" id="updatePasswordModal" tabindex="-1" role="basic" aria-hidden="true">
<img src="${request.contextPath}/assets/img/ajax-modal-loading.gif" alt=""	class="loading"/>
</div>
<script type="text/javascript" src="${request.contextPath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript">
	//表单验证
function bindRePassword(){
	
	//关闭按钮
	$("#btn_close").click(function() {
		var createAjax = $("#updatePasswordModal");
		if(confirm("确认关闭吗？")){
			createAjax.modal("hide");
		}
	});
	$('#updateRe').bind("click", function() {
			var baseUrl = $("#baseUrl").val();
			var password = $("#password").val();
			var newPassword = $("#newPassword").val();
			var repassPassword=$("#repass").val();
				$('#passwordErr').empty();
				$('#newPasswordErr').empty();
				$('#repassErr').empty();
				if(password==null || password==""){
					$('#passwordErr').append("请输入旧密码");
					return;
				}
				if(newPassword==null || newPassword==""){
					$('#newPasswordErr').append("请输入新密码");
					return;
				}
				if(newPassword!=repassPassword){
					$('#repassErr').append("两次密码输入不一致");
					return;
				}
			$.ajax({
				type : "POST",
				url :cscBasePath + "/cscWebPasswordController/updatePassword.json",
				async : false,
				data : {
					'password':password,
					'newPassword':newPassword
				},
				dataType : "text",
				success : function(data) {
					if(data=='success'){
						alert("修改成功！");
						$("#updatePasswordModal").modal("hide");
					}else if(data =='passErr'){
						alert("您输入的密码错误，请确认后重新输入！");
					}else{
						alert("修改失败！");
						$("#ajax").modal("hide");
					}
				}
			}, "json");
	});
}

function updatePasswordDaliog(){
	var updatePasswordModal=$('#updatePasswordModal');
	updatePasswordModal.load(cscBasePath + "/cscWebPasswordController/updatePasswordForm.json", function() {
		updatePasswordModal.modal({
		    backdrop:'static',
		    keyboard:false
		});
		updatePasswordModal.modal("show");
		bindRePassword();
	});
}

</script>
