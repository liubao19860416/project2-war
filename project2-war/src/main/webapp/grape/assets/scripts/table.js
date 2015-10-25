var TableStats = function () {
    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }
            // begin first table
            $('#sampleStats').dataTable({
                "aoColumns": [
                  { "bSortable": false, "sWidth": "8%","sClass":"text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sWidth": "8%", "sClass": "text-center" },
                  { "bSortable": false, "sWidth": "8%", "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                "bFilter": false,
                // set the initial value
                "iDisplayLength": 5,
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "抱歉， 没有找到",
                    "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty": "",
                    "sProcessing": "正在查询....",
                    "sInfoFiltered": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "前一页",
                        "sNext": "后一页",
                        "sLast": "尾页"
                    }
                },
                "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }
                ]
            });

            jQuery('#sampleStats tbody tr .checkboxes').change(function () {
                $(this).parents('tr').toggleClass("active");
            });
            $(".dataTables_paginate").addClass("pull-right")
            jQuery('#sampleStats_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#sampleStats_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
        }
    };
}();
var ShopQuery = function () {
    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }
            // begin first table
            $('#ShopQuery').dataTable({
                "aoColumns": [
                  { "bSortable": false, "sWidth": "8%", "sClass": "text-center" },
                  { "bSortable": false},
                  { "bSortable": false, "sWidth": "8%", "sClass": "text-center" }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                "bFilter": false,
                // set the initial value
                "iDisplayLength": 5,
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "抱歉， 没有找到",
                    "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty": "",
                    "sProcessing": "正在查询....",
                    "sInfoFiltered": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "前一页",
                        "sNext": "后一页",
                        "sLast": "尾页"
                    }
                },
                "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }
                ]
            });

            jQuery('#ShopQuery tbody tr .checkboxes').change(function () {
                $(this).parents('tr').toggleClass("active");
            });
            $(".dataTables_paginate").addClass("pull-right")
            jQuery('#ShopQuery_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#ShopQuery_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
        }
    };
}();
var OrderQuery = function () {
    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }
            // begin first table
            $('#OrderQuery').dataTable({
                "aoColumns": [
                  { "bSortable": false, "sWidth": "8%", "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" },
                  { "bSortable": false, "sClass": "text-center" }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                "bFilter": false,
                // set the initial value
                "iDisplayLength": 5,
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "抱歉， 没有找到",
                    "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty": "",
                    "sProcessing": "正在查询....",
                    "sInfoFiltered": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "前一页",
                        "sNext": "后一页",
                        "sLast": "尾页"
                    }
                },
                "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }
                ]
            });

            jQuery('#OrderQuery tbody tr .checkboxes').change(function () {
                $(this).parents('tr').toggleClass("active");
            });
            $(".dataTables_paginate").addClass("pull-right")
            jQuery('#OrderQuery_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#OrderQuery_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
        }
    };
}();
var MesGroup = function () {
    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }
            // begin first table
            $('#MesGroup').dataTable({
                "aoColumns": [
                  { "bSortable": false, "sWidth": "15%", "sClass": "text-center" },
                  { "bSortable": false}
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                "bFilter": false,
                // set the initial value
                "iDisplayLength": 5,
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "抱歉， 没有找到",
                    "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty": "",
                    "sProcessing": "正在查询....",
                    "sInfoFiltered": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "前一页",
                        "sNext": "后一页",
                        "sLast": "尾页"
                    }
                },
                "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }
                ]
            });

            jQuery('#MesGroup tbody tr .checkboxes').change(function () {
                $(this).parents('tr').toggleClass("active");
            });
            $(".dataTables_paginate").addClass("pull-right")
            jQuery('#MesGroup_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#MesGroup_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
        }
    };
}();
var UserAdvice = function () {
    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }
            // begin first table
            $('#UserAdvice').dataTable({
                "aoColumns": [
                  { "bSortable": false, "sWidth": "15%", "sClass": "text-center" },
                  { "bSortable": false },
                  { "bSortable": false },
                  { "bSortable": false }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                "bFilter": false,
                // set the initial value
                "iDisplayLength": 5,
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "抱歉， 没有找到",
                    "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty": "",
                    "sProcessing": "正在查询....",
                    "sInfoFiltered": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "前一页",
                        "sNext": "后一页",
                        "sLast": "尾页"
                    }
                },
                "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }
                ]
            });

            jQuery('#UserAdvice tbody tr .checkboxes').change(function () {
                $(this).parents('tr').toggleClass("active");
            });
            $(".dataTables_paginate").addClass("pull-right")
            jQuery('#UserAdvice_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#UserAdvice_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
        }
    };
}();