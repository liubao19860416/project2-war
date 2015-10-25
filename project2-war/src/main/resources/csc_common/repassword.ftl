<div style="width: 600px;margin-top:140px;" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet box">
							<div class="portlet-title" style="background: #4a8df8;">
									<div class="caption"><i class="icon-cogs"></i>密码修改</div>
									<button class="close" aria-hidden="true" data-dismiss="modal" type="button"></button>
							</div>
							<form id="passForm" class="form-horizontal" method="post">
								<table class="table table-striped table-bordered" >
											<tbody>
												<tr>
													<td class="active">登录账号</td>
													<td>${user.userName}</td>
												</tr>
												<tr>
													<td class="active"><i class="mark">*</i>旧密码</td>
													<td>
													<div class="form-group col-md-8 no-sapce"  style="position:relative;margin-bottom:0px;">
														<input class="form-control" type="password" data-required="1" name="password" id="password"/>
													</div>
													<div id="passwordErr" class="error form-control-static"></div>
													</td>
												</tr>
												<tr>
													<td class="active"><i class="mark">*</i>新密码</td>
													<td>
													<div class="form-group col-md-8 no-sapce"  style="position:relative;margin-bottom:0px;">
															<input class="form-control" type="password" data-required="2" name="newPassword" id="newPassword"/>
													</div>
													<div id="newPasswordErr" class="error form-control-static"></div>
													</td>
												</tr>
												<tr>
													<td class="active"><i class="mark">*</i>密码确认</td>
													<td>
														<div class="form-group col-md-8 no-sapce"  style="position:relative;margin-bottom:0px;">
															<input class="form-control" type="password" data-required="3" name="repass" id="repass"/>
														</div>
														<div id="repassErr" class="error form-control-static"></div>
													</td>
												</tr>
												<tr style="text-align:center;">
													<td colspan="2">
													<button type="button" class="btn blue" id="updateRe">
														保存
													</button>
													<button type="button" class="btn blue" style="margin-left:32px;" data-dismiss="modal">
														取消
													</button>
													</td>
												</tr>
											</tbody>
										</table>
										</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<style>

.mark{
	color:red;
}
.error{
	color:red;
}
</style>