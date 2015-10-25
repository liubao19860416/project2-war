var TableManaged = function() {

	return {

		// main function to initiate the module
		init : function() {
			if (!jQuery().dataTable) {
				return;
			}
			var sAjaxSource = $("#cscBasePath").val() + '/adv/advAjaxList.json';
			// begin datatable
			var modelsTable = $('#models-data')
					.dataTable(
							{
								"bFilter" : false,
								"bProcessing" : true,
								"sAjaxSource" : sAjaxSource,
								"fnServerParams" : function(aoData) {
									aoData.push({
										"name" : "territoryId",
										"value" : $("#qTerritoryId").val()
									}, {
										"name" : "blockName",
										"value" : $("#qBlockName").val()
									}, {
										"name" : "blockId",
										"value" : $("#qBlockId").val()
									}, {
										"name" : "blockNodeStatus",
										"value" : $("#qRowStatus").val()
									}, {
										"name" : "startTime",
										"value" : $("#qStartTime").val()
									}, {
										"name" : "endTime",
										"value" : $("#qEndTime").val()
									});
								},
								"sServerMethod" : "POST",
								"bServerSide" : true,
								"aoColumns" : [ {
									"mData" : "blockId",
									"bSortable" : false
								}, {
									"mData" : "territory.territoryName",
									"bSortable" : false
								}, {
									"mData" : "blockName",
									"bSortable" : false
								}, {
									"mData" : "blockId",
									"bSortable" : false
								}, {
									"mData" : "nodeTitle",
									"bSortable" : false
								}, {
									"mData" : "blockNodeStatus",
									"bSortable" : false
								}, {
									"mData" : "startTime",
									"bSortable" : false
								}, {
									"mData" : "createUser.userName",
									"bSortable" : false
								} ],
								"aLengthMenu" : [ [ 10, 20, 50 ],
										[ 10, 20, 50 ] // change per page
														// values here
								],
								"iDisplayLength" : 10,
								"sPaginationType" : "bootstrap",
								"oLanguage" : {
									"sUrl" : "../assets/scripts/jquery.dataTable.cn.js"
								},
								"aoColumnDefs" : [
										{
											'bSortable' : false,
											'aTargets' : [ 0 ]
										},
										{
											sDefaultContent : '',
											aTargets : [ '_all' ]
										},
										{
											'aTargets' : [ 0 ],
											"mData" : "",
											"mRender" : function(data, type,
													full) {
												return '<input type="radio" name="radio" class="checkboxes" value="'
														+ data
														+ ','
														+ full.nodeId
														+ ','
														+ full.blockNodeId
														+ '"/>';
											}
										},
										{
											'aTargets' : [ 5 ],
											"mData" : "",
											"mRender" : function(data, type,
													full) {
												if (data == '1') {
													return "待上线";
												} else if (data == '2') {
													return "已上线";
												} else if (data == '3') {
													return "已下线";
												}
											}
										} ],
								// 在每次获取数据并创建DOM后执行的操作（调用uniform插件，美化checkbox）
								"fnDrawCallback" : function(oSettings) {
									$('input.checkboxes').uniform(); // 调用uniform,美化checkbox
								},
								// 在Table初始化完成之后
								"fnInitComplete" : function(oSettings, json) {
									// 为每页显示多少条记录的select增加class
									$('.dataTables_length select').addClass(
											"form-control input-sm");
									// 为搜索框input增加class
									$('.dataTables_filter input').addClass(
											"form-control input-medium");
								}
							});

			// 具体某一项前面的checkbox，只能选择某一项，不能全选
			$('#models-data tbody tr .checkboxes').live("click", function() {
				var checkboxes = $('#models-data tbody tr .checkboxes');
				checkboxes.parents('tr').removeClass('active'); // 移除所有tr的active
																// class
				checkboxes.not($(this)).attr("checked", false); // 将除$(this)之外所有的.checkboxes取消选择

				jQuery.uniform.update(checkboxes); // jQuery.uniform更新数据
				// checkboxes 选择不到:checked 的，又用$('#models-data tbody tr
				// .checkboxes:checked')重新选择了一次
				if ($('#models-data tbody tr .checkboxes:checked').length > 0) {
					$('.table-toolbar .group-control').attr('disabled', false);
					$(this).parents('tr').addClass("active");
				} else {
					$('.table-toolbar .group-control').attr('disabled', true);
				}
			});

			return modelsTable;
		}

	};

}();
