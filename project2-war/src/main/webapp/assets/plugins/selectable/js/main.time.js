var k=0;
var alldata;
var clickdata;
var key;
var dragEvent;
var mdseDsList = new YYFMap(); //用来存储3天后的所有数据的集合
var addMdseDsList = new YYFMap(); //用来存储近来3天增加的集合

var maxUpdate="0";
var thisUpdate="0";

var fristData;


jQuery(function($){
    $.datepicker.regional['zh-CN'] = {
        closeText: '关闭',
        prevText: '&#x3c;上月',
        nextText: '下月&#x3e;',
        currentText: '今天',
        monthNames: ['一月','二月','三月','四月','五月','六月',
            '七月','八月','九月','十月','十一月','十二月'],
        monthNamesShort: ['一','二','三','四','五','六',
            '七','八','九','十','十一','十二'],
        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
        dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
        dayNamesMin: ['日','一','二','三','四','五','六'],
        weekHeader: '周',
        dateFormat: 'yy-mm-dd',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '年'};
    $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
});
Date.prototype.format =function(format)
{
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours()-8,   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4- RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
                RegExp.$1.length==1? o[k] :
                ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}
Date.prototype.format8 =function(format)
{
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4- RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
                RegExp.$1.length==1? o[k] :
                ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}
var  pres=fristData;
var preNo=0;

var nextNo=0;

$(function(){
   // $("#yyf").click(function(){getLastUpdateTimeandSave(dealerId);});
   // $('#copyNextWeek').iCheck('check');

    $('#pre').click(function() {
         if(preNo==0){


         }else{
             $("#checknext").show();
             //$('#copyNextWeek').iCheck('check');
             pres=  $('#calendar') .fullCalendar( 'clientEvents');
             $('#calendar') .fullCalendar( 'removeEvents');
             $('#calendar').fullCalendar('prev');
             $('#calendar').fullCalendar('addEventSource', pres, true);
             $('#pre').removeClass("btn-primary");
             $('#next').addClass("btn-primary");
             nextNo=0;
             preNo=0;
         }

    });
    $('#next').click(function() {
       if(nextNo==0){
            $("#checknext").hide();
           //$('#copyNextWeek').iCheck('uncheck');
           pres=$('#calendar') .fullCalendar( 'clientEvents');
           $('#calendar') .fullCalendar( 'removeEvents');
        $('#calendar').fullCalendar('next');
        $('#calendar').fullCalendar('addEventSource', pres, true);
        $('#next').removeClass("btn-primary");
        $('#pre').addClass("btn-primary");
           nextNo=1;
           preNo=1;
       }else{

        }
    });


    // $("#startTime").datetimepicker();用时间滑块调整时间
    //$("#endTime").datetimepicker();

   // init();
});
function init(){
    $('#calendar') .fullCalendar( 'removeEvents');
    var formdata = {};

    formdata.dealerId=dealerId;

    $.ajax({
        type: "POST",
        url: "showMdseDsDetail.json",
        data:JSON.stringify(formdata),
        dataType: "json",
        contentType:"application/json",
        success: function(data){
            var events = [];
            var ev =data.mdseDsList;
           console.log(data)
            for( var i=0; i<ev.length ; i++) {
                //  console.log(ev[i].startTime+ev[i].dsId)
                events.push({
                    id:ev[i].dsId,
                    title: ' ',
                    start:ev[i].startTime,
                    end: ev[i].endTime,
                    price_p:ev[i].partsDs*100,
                    editable:ev[i].flag,
                    durationEditable:false,
                    price_g:ev[i].laborhourDs*100,
                    number_t:ev[i].wkst,
                    number_g:ev[i].usedWkst
                });


            }
            fristData = events;
           // save();
            $('#calendar').fullCalendar('addEventSource', fristData, true);
          //  $("#dealerQuery").hide();
         $("#detf").show();

        }
    });
}
function eventpojo(id,title,start,end,price_p,price_g,editable,number_t,number_g){
    this.id=id;
    this.title="";
    this.start=start;
    this.end=end;
    this.price_p=price_p;
    this.price_g=price_g;
    this.editable=editable;
    this.number_t=number_t;
    this.number_g=number_g;
}

$(document).ready(function() {

    var currentLangCode="zh-cn";
    alldata=$('#calendar').fullCalendar({
        header: {
            left: '',
            center: 'title',
            right: ' '
        },

        height:1500,
        lang: currentLangCode,
        defaultView:'agendaWeek',
        selectable: true,
        selectHelper: true,
        slotEventOverlap:false,
        timezone:'local',

        eventDragStart:function(event){

            //dragEvent=event;
            $(this).unbind("hover");
            $(this).unbind("mouseenter");

        } ,

        eventDragStop:function(date){
           // key = date.start+"@"+date.end;
          //  $('#calendar').fullCalendar('renderEvent', dragEvent, true); // stick? = true
            $(this).unbind("hover");
            $(this).unbind("mouseenter");
            $(this).poshytip('hide');
            $(".tip-darkgray").remove();
        },
        eventResizeStart :function(){
            $(this).unbind("hover");
            $(this).unbind("mouseenter");
        } ,
        dayClick:function( date, allDay, jsEvent, view ) {
            $("#rightMenu1").css("display","none");
            var oldsTime=   new Date(date).getTime()
            var today =new Date().format8('yyyy/MM/dd 00:00:00');
            var maxDay  =new Date(today).getTime()+259200000;
            if(oldsTime-new Date(today).getTime()<0){

                return;

            }
            if(oldsTime<maxDay){
               // dayClick_yyf(date);
            }else{
              //  dayClick_yyf(date);
            }

        },
        eventMouseover:function( event, jsEvent, view ) {

            $(".tip-darkgray").remove();
            tip(this,event);


        },
        eventMouseout:function( event, jsEvent, view ) {
            $(".tip-darkgray").remove();



        },
        eventClick: function(calEvent, jsEvent, view) {

//                alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//                alert('View: ' + view.name);
            // change the border color just for fun
            $("#rightMenu").css("display","none");
            var oldsTime=   new Date(calEvent.start).getTime()
            var today =new Date().format8('yyyy/MM/dd 00:00:00');
            var maxDay  =new Date(today).getTime()+259200000;
            if(oldsTime-new Date(today).getTime()<0){

                return;

            }
            if(oldsTime<maxDay){
              //  eventClick_yyf(calEvent);
                $(this).css('border-color', 'red');
            }else{
            //    eventClick_yyf(calEvent);
                $(this).css('border-color', 'red');
            }

        },
        select: function(start, end) {
            var ss= document.createElement("div");
            ss.style.color="red";
            ss.innerText=k++;
            var title =ss;
            var eventData;
            if (title) {
                eventData = {
                    id:123,
                    title: title.innerHTML,
                    start: start,
                    end: end,
                    content:"yyf"
                };

                //$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
            }
            $('#calendar').fullCalendar('unselect');
        },
            eventDrop: function(event, delta, revertFunc) {


                //获取今天的时间并且格式化
                var oldsTime =new Date(event.start.format()).getTime()
                var today =new Date().format8('yyyy/MM/dd 00:00:00');
                var maxDay  =new Date(today).getTime()+259200000;
                if(oldsTime-new Date(today).getTime()<0){
                    alert("不允许操作")
                    revertFunc();

                }
                if(oldsTime<maxDay){
                   // alert("我在三天以内")
                }else{
                   // alert("我不在三天以内了")
                }


            },
        slotMinutes:60,
        events: $('#calendar').fullCalendar( 'clientEvents' )

//        events: [
//            {
//                id:1,
//                title: ' ',
//                start: '2014-06-16 11:00:00',
//                end: '2014-06-16 13:00:00',
//                price_p:100,
//                editable:false,
//                slotEventOverlap:false,
//                price_g:100,
//                number_t:10,
//                number_g:7
//
//            },
//            {
//                id: 2,
//                title: ' ',
//                start: '2014-06-17T10:00:00',
//                end: '2014-06-17T11:00:00',
//                price_p:100,
//                editable:true,
//                slotEventOverlap:false,
//                price_g:100,
//                number_t:7,
//                number_g:1
//
//            },
//            {
//                id: 3,
//                title: ' ',
//                start: '2014-06-14T12:00:00',
//                end: '2014-06-14T13:00:00',
//                price_p:100,
//                editable:false,
//                slotEventOverlap:false,
//                price_g:100,
//                number_t:12,
//                number_g:7
//            }  ,
//            {
//                id: 4,
//                title: ' ',
//                start: '2014-06-14T14:00:00',
//                end: '2014-06-14T15:00:00',
//                price_p:100,
//                editable:true,
//                slotEventOverlap:false,
//                price_g:100,
//                number_t:20,
//                number_g:10
//            } ,
//            {
//                id: 5,
//                title: ' ',
//                start: '2014-06-16T21:00:00',
//                end: '2014-06-16T22:00:00',
//                editable:false,
//                slotEventOverlap:false,
//                price_p:100,
//                price_g:100,
//                number_t:15,
//                number_g:7
//            }
//
//        ]
    });

});
var getOffset = {
    top: function (obj) {
        return obj.offsetTop + (obj.offsetParent ? arguments.callee(obj.offsetParent) : 0)
    },
    left: function (obj) {
        return obj.offsetLeft + (obj.offsetParent ? arguments.callee(obj.offsetParent) : 0)
    }
};
function eventClick_yyf(obj)
{


    $("#rightMenu").css("display","none");
    $("#rightMenu1").css("display","none");
    var oMenu = document.getElementById("rightMenu1");
    var aUl = oMenu.getElementsByTagName("ul");
    var aLi = oMenu.getElementsByTagName("li");

    var showTimer = hideTimer = null;
    var i = 0;
    var maxWidth = maxHeight = 0;
    var aDoc = [document.documentElement.offsetWidth, document.documentElement.offsetHeight];

    oMenu.style.display = "none";

    for (i = 0; i < aLi.length; i++)
    {
        //为含有子菜单的li加上箭头
        aLi[i].getElementsByTagName("ul")[0] && (aLi[i].className = "sub");
        aLi[i].onclick=function(){

            if(this.id=="change"){
                $("#price_chp").val(parseInt(obj.price_p));
                $("#price_chg").val(parseInt(obj.price_g));
                $("#number_cht").val(obj.number_t);
                $( "#dialogupdate" ).dialog({

                    width:800,
                    height:500,

                    draggable:false,
                    modal:true,
                        buttons: [
                        {
                            text: "修改",
                            click: function() {
                                obj.price_p= $("#price_chp").val();
                                obj.price_g= $("#price_chg").val();
                                if($("#number_cht").val()*1<  obj.number_g)
                                {

                                    obj.number_t=   obj.number_g;

                                }else{
                                obj.number_t=$("#number_cht").val();
                                 //   console.log(obj.number_t);
                                }
                                alldata.fullCalendar( 'updateEvent', obj )



                                $( this ).dialog( "close" );
                            }
                        },
                        {
                            text: "取消",
                            click: function() {
                                $( this ).dialog( "close" );
                            }
                        }
                    ]
                });


            }

            if(this.id=="del"){

                if(!obj.editable)  {
                    alert("操作失败");
                }else{
                    alldata .fullCalendar('removeEvents',obj.id);
                }


            }
            if(this.id=="paste"){

                copy(obj);

            }
            if(this.id=="copy"){
                clickdata=obj;
            }


        };
        //鼠标移入
        aLi[i].onmouseover = function ()
        {
            var oThis = this;
            var oUl = oThis.getElementsByTagName("ul");

            //鼠标移入样式
            oThis.className += " active";

            //显示子菜单
            if (oUl[0])
            {
                clearTimeout(hideTimer);
                showTimer = setTimeout(function ()
                {
                    for (i = 0; i < oThis.parentNode.children.length; i++)
                    {
                        oThis.parentNode.children[i].getElementsByTagName("ul")[0] &&
                        (oThis.parentNode.children[i].getElementsByTagName("ul")[0].style.display = "none");
                    }
                    oUl[0].style.display = "block";
                    oUl[0].style.top = oThis.offsetTop + "px";
                    oUl[0].style.left = oThis.offsetWidth + "px";
                    setWidth(oUl[0]);

                    //最大显示范围
                    maxWidth = aDoc[0] - oUl[0].offsetWidth;
                    maxHeight = aDoc[1] - oUl[0].offsetHeight;

                    //防止溢出
                    maxWidth < getOffset.left(oUl[0]) && (oUl[0].style.left = -oUl[0].clientWidth + "px");
                    maxHeight < getOffset.top(oUl[0]) && (oUl[0].style.top = -oUl[0].clientHeight + oThis.offsetTop + oThis.clientHeight + "px")
                },300);
            }
        };

        //鼠标移出
        aLi[i].onmouseout = function ()
        {
            var oThis = this;
            var oUl = oThis.getElementsByTagName("ul");
            //鼠标移出样式
            oThis.className = oThis.className.replace(/\s?active/,"");

            clearTimeout(showTimer);
            hideTimer = setTimeout(function ()
            {
                for (i = 0; i < oThis.parentNode.children.length; i++)
                {
                    oThis.parentNode.children[i].getElementsByTagName("ul")[0] &&
                    (oThis.parentNode.children[i].getElementsByTagName("ul")[0].style.display = "none");
                }
            },300);
        };
    }


    //自定义右键菜单

    //点击隐藏菜单
    document.onclick = function ()
    {
        oMenu.style.display = "none"
    };

    //取li中最大的宽度, 并赋给同级所有li
    function setWidth(obj)
    {
        maxWidth = 0;
        for (i = 0; i < obj.children.length; i++)
        {
            var oLi = obj.children[i];
            var iWidth = oLi.clientWidth - parseInt(oLi.currentStyle ? oLi.currentStyle["paddingLeft"] : getComputedStyle(oLi,null)["paddingLeft"]) * 2
            if (iWidth > maxWidth) maxWidth = iWidth;
        }
        for (i = 0; i < obj.children.length; i++) obj.children[i].style.width = maxWidth + "px";
    }
    var event = getEvent();


    oMenu.style.display = "block";
    oMenu.style.top = event.clientY + "px";
    oMenu.style.left = event.clientX + "px";
    setWidth(aUl[0]);

    //最大显示范围
    maxWidth = aDoc[0] - oMenu.offsetWidth;
    maxHeight = aDoc[1] - oMenu.offsetHeight;

    //防止菜单溢出
    oMenu.offsetTop > maxHeight && (oMenu.style.top = maxHeight + "px");
    oMenu.offsetLeft > maxWidth && (oMenu.style.left = maxWidth + "px");
    return false;
};

function dayClick_yyf(date)
{
    $("#rightMenu1").css("display","none");
    $("#rightMenu").css("display","none");
    var clickDate ;
    var d;
    var oldTime  ;
    var dendTime ;
    if (typeof(date._i) == "undefined") {
        d =new Date(date).format8('yyyy-MM-dd hh:mm');
       var ds =new Date(date).format8('yyyy/MM/dd hh:mm');
        oldTime = new Date(ds).getTime();
        dendTime =new Date(oldTime+7200000).format8('yyyy-MM-dd hh:mm');

    }else{
    clickDate = date._i[0]+"/"+ (date._i[1]*1+1)+"/"+ date._i[2]+" "+ date._i[3]+":"+ date._i[4]+":"+ date._i[5]+ date._i[6];

    d =new Date(clickDate).format8('yyyy-MM-dd hh:mm');
        oldTime = new Date(clickDate).getTime();
        dendTime =new Date(oldTime+7200000).format8('yyyy-MM-dd hh:mm');

    }


    var oMenu1 = document.getElementById("rightMenu");
    var aUl1 = oMenu1.getElementsByTagName("ul");
    var aLi1 = oMenu1.getElementsByTagName("li");

    var showTimer = hideTimer = null;
    var i = 0;
    var maxWidth = maxHeight = 0;
    var aDoc = [document.documentElement.offsetWidth, document.documentElement.offsetHeight];

    oMenu1.style.display = "none";

    for (i = 0; i < aLi1.length; i++)
    {
        //为含有子菜单的li加上箭头
        aLi1[i].getElementsByTagName("ul")[0] && (aLi1[i].className = "sub");
        aLi1[i].onclick=function(){

            $("#startTime").val(d);
            startTime_Change();
          //  $("#endTime").val(dendTime);

            $( "#dialog" ).dialog({

                width:800,
                height:500,
                draggable:false,
                modal:true,
                buttons: [
                    {
                        text: "添加",
                        click: function() {
                            if($("#copyNextWeek").attr("checked")=="checked") {
                                var allevents= alldata.fullCalendar("clientEvents");
                                var title=" ";
                                var startTime=$("#startTime").val();
                                var endTime=$("#endTime").val();
                                var price_p=$("#price_p").val();
                                var price_g=$("#price_g").val();
                                var number_t=$("#number_t").val();
                                var oldsTime = new Date( $("#startTime").val().replace("-","/").replace("-","/")).getTime();
                                var newsTime =new Date(oldsTime+604800000).format8('yyyy-MM-dd hh:mm');

                                var oldeTime = new Date( $("#endTime").val().replace("-","/").replace("-","/")).getTime();
                                var newoTime =new Date(oldeTime+604800000).format8('yyyy-MM-dd hh:mm');
                                var startTimeNextWeek=newsTime;
                                var endTimeNextWeek=newoTime;
                                 //获取今天的时间并且格式化
                                var today =new Date().format8('yyyy/MM/dd 00:00:00');
                                var maxDay  =new Date(today).getTime()+259200000;
                                if(oldsTime-new Date(today).getTime()<0){
                                    alert("不允许操作") ;
                                    $( this ).dialog( "close" );
                                    return;

                                }
                                if(oldsTime<maxDay){
                                  //  alert("我在三天以内")
                                }else{
                                 //   alert("我不在三天以内了")
                                }

                                eventData = {
                                    id:"$"+allevents.length+new Date()+new Date().getSeconds,
                                    editable:true,
                                    durationEditable:false,
                                    title: title,
                                    start: startTime,
                                    end: endTime,
                                    price_p:price_p,
                                    price_g:price_g,
                                    number_t:number_t,
                                    number_g:0
                                };

                                $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true

                                eventDataNextWeek = {
                                    id:"$"+allevents.length+new Date()+new Date().getSeconds+1000,
                                    editable:true,
                                    durationEditable:false,
                                    title: title,
                                    start: startTimeNextWeek,
                                    end: endTimeNextWeek,
                                    price_p:price_p,
                                    price_g:price_g,
                                    number_t:number_t,
                                    number_g:0
                                };
                                $('#calendar').fullCalendar('renderEvent', eventDataNextWeek, true); // stick? = true
                            }else{
                                var allevents= alldata.fullCalendar("clientEvents");
                                var title=" ";
                                var startTime=$("#startTime").val();
                                var endTime=$("#endTime").val();
                                var price_p=$("#price_p").val();
                                var price_g=$("#price_g").val();
                                var number_t=$("#number_t").val();
                                var oldsTime = new Date( $("#startTime").val().replace("-","/").replace("-","/")).getTime();
                                //获取今天的时间并且格式化
                                var today =new Date().format8('yyyy/MM/dd 00:00:00');
                                var maxDay  =new Date(today).getTime()+259200000;
                                if(oldsTime-new Date(today).getTime()<0){
                                    alert("不允许操作") ;
                                    $( this ).dialog( "close" );
                                    return;
                                }
                                if(oldsTime<maxDay){
                                  //  alert("我在三天以内")
                                }else{
                                  //  alert("我不在三天以内了")
                                }
                                eventData = {
                                    id:"$"+allevents.length+new Date()+new Date().getSeconds,
                                    title: title,
                                    editable:true,
                                    durationEditable:false,
                                    start: startTime,
                                    end: endTime,
                                    price_p:price_p,
                                    price_g:price_g,
                                    number_t:number_t,
                                    number_g:0
                                };
                                var evs= new eventpojo(eventData.id,eventData.title,eventData.start,eventData.end,eventData.price_p,eventData.price_g,eventData.editable,eventData.number_t,eventData.number_g)

                                $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
                            }


                            $( this ).dialog( "close" );
                        }
                    },
                    {
                        text: "取消",
                        click: function() {
                            $( this ).dialog( "close" );
                        }
                    }
                ]
            });
        };
        //鼠标移入
        aLi1[i].onmouseover = function ()
        {
            var oThis = this;
            var oUl = oThis.getElementsByTagName("ul");

            //鼠标移入样式
            oThis.className += " active";

            //显示子菜单
            if (oUl[0])
            {
                clearTimeout(hideTimer);
                showTimer = setTimeout(function ()
                {
                    for (i = 0; i < oThis.parentNode.children.length; i++)
                    {
                        oThis.parentNode.children[i].getElementsByTagName("ul")[0] &&
                        (oThis.parentNode.children[i].getElementsByTagName("ul")[0].style.display = "none");
                    }
                    oUl[0].style.display = "block";
                    oUl[0].style.top = oThis.offsetTop + "px";
                    oUl[0].style.left = oThis.offsetWidth + "px";
                    setWidth(oUl[0]);

                    //最大显示范围
                    maxWidth = aDoc[0] - oUl[0].offsetWidth;
                    maxHeight = aDoc[1] - oUl[0].offsetHeight;

                    //防止溢出
                    maxWidth < getOffset.left(oUl[0]) && (oUl[0].style.left = -oUl[0].clientWidth + "px");
                    maxHeight < getOffset.top(oUl[0]) && (oUl[0].style.top = -oUl[0].clientHeight + oThis.offsetTop + oThis.clientHeight + "px")
                },300);
            }
        };

        //鼠标移出
        aLi1[i].onmouseout = function ()
        {
            var oThis = this;
            var oUl = oThis.getElementsByTagName("ul");
            //鼠标移出样式
            oThis.className = oThis.className.replace(/\s?active/,"");

            clearTimeout(showTimer);
            hideTimer = setTimeout(function ()
            {
                for (i = 0; i < oThis.parentNode.children.length; i++)
                {
                    oThis.parentNode.children[i].getElementsByTagName("ul")[0] &&
                    (oThis.parentNode.children[i].getElementsByTagName("ul")[0].style.display = "none");
                }
            },300);
        };
    }


    //自定义右键菜单

    //点击隐藏菜单
    document.onclick = function ()
    {
        oMenu1.style.display = "none"
    };

    //取li中最大的宽度, 并赋给同级所有li
    function setWidth(obj)
    {
        maxWidth = 0;
        for (i = 0; i < obj.children.length; i++)
        {
            var oLi = obj.children[i];
            var iWidth = oLi.clientWidth - parseInt(oLi.currentStyle ? oLi.currentStyle["paddingLeft"] : getComputedStyle(oLi,null)["paddingLeft"]) * 2
            if (iWidth > maxWidth) maxWidth = iWidth;
        }
        for (i = 0; i < obj.children.length; i++) obj.children[i].style.width = maxWidth + "px";
    }
    var event = getEvent();
    oMenu1.style.display = "block";
    oMenu1.style.top = event.clientY + "px";
    oMenu1.style.left = event.clientX + "px";
    setWidth(aUl1[0]);

    //最大显示范围
    maxWidth = aDoc[0] - oMenu1.offsetWidth;
    maxHeight = aDoc[1] - oMenu1.offsetHeight;

    //防止菜单溢出
    oMenu1.offsetTop > maxHeight && (oMenu1.style.top = maxHeight + "px");
    oMenu1.offsetLeft > maxWidth && (oMenu1.style.left = maxWidth + "px");
    return false;
};


function startTime_Change(){

    var oldTime = new Date( $("#startTime").val().replace("-","/").replace("-","/")).getTime();

    var dendTime1 =new Date(oldTime+7200000/2).format8('yyyy-MM-dd hh:mm');
    var dendTime2 =new Date(oldTime+7200000).format8('yyyy-MM-dd hh:mm');
    $("#endTime").empty();

    $("#endTime").append("<option value='"+dendTime2+"'>"+dendTime2+"</option>")
    $("#endTime").append("<option value='"+dendTime1+"'>"+dendTime1+"</option>")
  //  $("#endTime").val(dendTime);
}


function tip(id,obj) {
    var text =  creatSpan(obj.number_t,obj.number_g).innerHTML;
    var oldTimeStart = new Date(obj.start).getTime();
    var oldTimeEnd = new Date(obj.end).getTime();
    var start=new Date(oldTimeStart).format8('MM-dd hh:mm');
    var end=new Date(oldTimeEnd).format8('MM-dd hh:mm');
    var ss= document.createElement("div");
    ss.style.fontFamily="微软雅黑";
    ss.style.fontSize="12px";
    var html="" +
    "<p>开始时间："+start+"</p><p>结束时间："+end+"</p>" ;
if(parseInt(obj.price_p)>100){
     var res = parseInt(obj.price_p)-100 ;
  html = html+ "<p>配件折扣：加价 "+res+"%</p>";

} else if(parseInt(obj.price_p)==100){
    html = html+ "<p>配件折扣：全价</p>"
}
else{
  html = html+ "<p>配件折扣："+parseInt(obj.price_p)/10+"折</p>"
}
if(parseInt(obj.price_g)>100){
    var res = parseInt(obj.price_g)-100 ;
  html = html+ "<p>工时折扣：加价 "+res+"%</p>";
}else if(parseInt(obj.price_g)==100){
    html = html+ "<p>工时折扣：全价</p>"
} else{
  html = html+ "<p>工时折扣："+parseInt(obj.price_g)/10+"折</p>"
}

  html =html   +"<p>工位剩余："+(obj.number_t-obj.number_g)+"</p>"+text ;

ss.innerHTML=html;
    var $cr=$(id);


    $cr.poshytip({
        className: 'tip-darkgray',
        showTimeout:1,
        alignTo: 'target',
        alignX: 'inner-left',
        offsetX: 0,
        offsetY: 5,
        allowTipHover: false,
        content:ss
    });



}
function creatSpan(h,m){
    var totalNo = h;
    var usedNo = m;
    var allDiv= document.createElement("div");
    for(var l = totalNo-1 ; l>=0; l--){
        var span = document.createElement("span");
        if(l<usedNo){
            span.style.backgroundColor="#E04343"
        } else{
            span.style.backgroundColor="#A0D024"
        }
        span.style.display="inline-block";
        span.style.width="8px";
        span.style.marginLeft="1px";
        span.style.height="8px";
        allDiv.appendChild(span)

    }
    return allDiv;
}

function copy(obj){
    var test= alldata.fullCalendar("clientEvents");

    var title=obj.title;
    var oldTimeStart = new Date(obj.start).getTime();
    var oldTimeEnd = new Date(obj.end).getTime();
    var start=new Date(oldTimeStart).format8('yyyy-MM-dd hh:mm');
    var end=new Date(oldTimeEnd).format8('yyyy-MM-dd hh:mm');
    //获取今天的时间并且格式化
    var oldsTime =new Date(obj.start).getTime();
    var today =new Date().format8('yyyy/MM/dd 00:00:00');
    var maxDay  =new Date(today).getTime()+259200000;

    eventDatas = {
        id:"$"+test.length+new Date()+new Date().getSeconds,
        title: title,
        start: start,
        editable:true,
        durationEditable:false,
        end: end,
        price_p:obj.price_p,
        price_g:obj.price_g,
        number_t:0,
        number_g:0
    };

    if(oldsTime-new Date(today).getTime()<0){



    } else{
        clickdata=obj;
        $('#calendar').fullCalendar('renderEvent', eventDatas, true); // stick? = true
    }


}



function hotkey()
{

    var a=getEvent().which;

    if((a==86)&&(getEvent().ctrlKey))
    {
        copy(clickdata);
    }
    if((a==83)&&(getEvent().ctrlKey))
    {
      //  copy(clickdata);
       // getLastUpdateTimeandSave(dealerId)
        return false;
    }
}// end hotkey
document.onkeydown = hotkey; //当onkeydown 事件发生时调用hotkey函数

$(function(){
   // getLastUpdateTimeandSave(dealerId);

});
function getLastUpdateTimeandSave(id){
    var formdata = {};

    formdata.dealerId=id;
     $.ajax({
        type: "POST",
        url: "http://10.32.17.125:8080/dop/mdseManager/getMdseDsMaxUpdateTime/0",
        data:JSON.stringify(formdata),
        dataType: "json",
        contentType:"application/json",
        success: function(data){
             if(maxUpdate==0){
                 maxUpdate= data.result.maxUpdate ;
                 console.log(maxUpdate);
             }else{
                 thisUpdate =data.result.maxUpdate;
                 if(maxUpdate==thisUpdate) {
                     yyf(id);
                 }  else{
                     if(window.confirm('内容已经改变是否刷新数据？')){
;
                         resetTime(id);
                         init();
                     }else{

                         return ;
                     }
                 }
             }


        }
    });
}
time={
    timeForIE:function(str){

        //返回IE认识的一天的开始的0点结构 示例 2014/06/25 00:00:00
        var beginDay=str.replace("-","/").replace("-","/");
        beginDay=beginDay.substring(0,10)+" 00:00:00"
        return  beginDay;
    },
    dayNo:function(str){

        var oldTimeStart = new Date(str).getTime();
        return  oldTimeStart;
    }
}
     var fristoutthree= new Array();
  function save(){

      //获取今天的时间并且格式化
      var today =new Date().format8('yyyy/MM/dd 00:00:00');
      var maxDay  =new Date(today).getTime()+259200000;

      for(var i=0; i<fristData.length;i++){
          var oldsTime = new Date( fristData[i].start.replace("-","/").replace("-","/")).getTime();
          if(oldsTime-new Date(today).getTime()>=0){
             var _key = fristData[i].start.substring(0,10);
              if(mdseDsList.containsKey(_key)){
                  mdseDsList.get(_key).push(fristData[i]);
              }else{
                 var array = new Array();
                  array.push(fristData[i])
                  mdseDsList.put(_key,array);


              }

          }
          if(oldsTime-new Date(today).getTime()>=0&&oldsTime<maxDay){

          }
          if(oldsTime>=maxDay){
              fristoutthree.push(_key);
          }
      }
     console.log( unique(fristoutthree))

  }
  function yyf(id){

          var today =new Date().format8('yyyy/MM/dd 00:00:00');
          var maxDay  =new Date(today).getTime()+259200000;
          var pr= new YYFMap();
          pr=  $('#calendar') .fullCalendar( 'clientEvents');
          var inthree= new Array();
          var outthree= new Array();
          var updateMdseDsList = new YYFMap(); //用来存储集合
          for(var i=0; i<pr.length;i++){
              var oldsTime = new Date( pr[i].start).getTime();
              var _key = new Date( pr[i].start).format8('yyyy-MM-dd 00:00:00').substring(0,10);

              if(oldsTime-new Date(today).getTime()>=0){

                  if(updateMdseDsList.containsKey(_key)){

                      updateMdseDsList.get(_key).push(pr[i]);


                  }else{
                      var array = new Array();
                      array.push(pr[i])
                      updateMdseDsList.put(_key,array);


                  }

              }
              if(oldsTime-new Date(today).getTime()>=0&&oldsTime<maxDay){
                  inthree.push(_key);
              }
              if(oldsTime>=maxDay){
                  outthree.push(_key);
              }
          }


          var   mdseDsListre = [];
          var   addMdseDsList = [];
          var   updateDsList = [];
          for(var q = 0 ;q<fristoutthree.length;q++){
              outthree.push(fristoutthree[q]);
          }
          outthree=unique(outthree);

          inthree=unique(inthree);

          for(var j=0 ; j<inthree.length;j++){
              for(var k= 0; k< updateMdseDsList.get(inthree[j]).length; k++){
                  for (var f= k+1; f< updateMdseDsList.get(inthree[j]).length; f++) {
                      if(new Date(updateMdseDsList.get(inthree[j])[k].start).format8('yyyy-MM-dd hh:mm:ss')==new Date(updateMdseDsList.get(inthree[j])[f].start).format8('yyyy-MM-dd hh:mm:ss')
                          &&new Date(updateMdseDsList.get(inthree[j])[k].end).format8('yyyy-MM-dd hh:mm:ss')==new Date(updateMdseDsList.get(inthree[j])[f].end).format8('yyyy-MM-dd hh:mm:ss')){
                          alert("有重复的！")
                          return;
                      }
                  }
                  if((updateMdseDsList.get(inthree[j])[k].id+"").substring(0,1)=="$"){
                      addMdseDsList.push({
                          "maintDate": inthree[j],
                          "startTime": new Date( updateMdseDsList.get(inthree[j])[k].start).format8('yyyy-MM-dd hh:mm:ss'),
                          "endTime":  new Date( updateMdseDsList.get(inthree[j])[k].end).format8('yyyy-MM-dd hh:mm:ss'),
                          "laborhourDs": updateMdseDsList.get(inthree[j])[k].price_g/100,
                          "partsDs": updateMdseDsList.get(inthree[j])[k].price_p/100,
                          "wkst": updateMdseDsList.get(inthree[j])[k].number_t,
                          "usedWkst":updateMdseDsList.get(inthree[j])[k].number_g,
                          "operaterNo":userId,
                          "dealerId":dealerId
                      });
                  }else{


                      updateDsList.push({
                          "dsId":updateMdseDsList.get(inthree[j])[k].id,
                          "maintDate": inthree[j],
                          "startTime":  updateMdseDsList.get(inthree[j])[k].start._i,
                          "endTime":   updateMdseDsList.get(inthree[j])[k].end._i,
                          "laborhourDs": updateMdseDsList.get(inthree[j])[k].price_g/100,
                          "partsDs": updateMdseDsList.get(inthree[j])[k].price_p/100,
                          "wkst": updateMdseDsList.get(inthree[j])[k].number_t,
                          "usedWkst":updateMdseDsList.get(inthree[j])[k].number_g,
                          "operaterNo":userId

                      })
                  }
              }
          }

          for(var j=0 ; j<outthree.length;j++){
              if(updateMdseDsList.get(outthree[j]) ) {
                  var arr = new Array();
                  for (var k = 0; k < updateMdseDsList.get(outthree[j]).length; k++) {
                      for (var f= k+1; f< updateMdseDsList.get(outthree[j]).length; f++) {
                          if(new Date(updateMdseDsList.get(outthree[j])[k].start).format8('yyyy-MM-dd hh:mm:ss')==new Date(updateMdseDsList.get(outthree[j])[f].start).format8('yyyy-MM-dd hh:mm:ss')
                              &&new Date(updateMdseDsList.get(outthree[j])[k].end).format8('yyyy-MM-dd hh:mm:ss')==new Date(updateMdseDsList.get(outthree[j])[f].end).format8('yyyy-MM-dd hh:mm:ss')){
                              alert("有重复的！")
                              return;
                          }
                      }
                      console.log()
                      arr.push( {
                          "maintDate": outthree[j],
                          "startTime": new Date(updateMdseDsList.get(outthree[j])[k].start).format8('yyyy-MM-dd hh:mm:ss'),
                          "endTime": new Date(updateMdseDsList.get(outthree[j])[k].end).format8('yyyy-MM-dd hh:mm:ss'),
                          "laborhourDs": updateMdseDsList.get(outthree[j])[k].price_g / 100,
                          "partsDs": updateMdseDsList.get(outthree[j])[k].price_p / 100,
                          "wkst": updateMdseDsList.get(outthree[j])[k].number_t,
                          "usedWkst": updateMdseDsList.get(outthree[j])[k].number_g,
                          "operaterNo": userId,
                          "dealerId": dealerId
                      })


                  }
                  mdseDsListre.push({
                      "maintDate": outthree[j],
                      "maintDateDsList": arr




                  })
              }
              else{
                  mdseDsListre.push({
                      "maintDate": outthree[j],
                      "maintDateDsList": [

                      ]


                  })
              }
          }
          //  console.log(mdseDsListre );
          var param={
              "mdseDsMap": {
                  "updateMdseDsList":updateDsList,
                  "addMdseDsList": addMdseDsList
              },
              "mdseDsList":
                  mdseDsListre

          }
          console.log(JSON.stringify(param))
          // console.log(updateMdseDsList.get("2014-06-28"));
          $.ajax({
              type: "POST",
              url: "http://10.32.17.125:8080/dop/mdseManager/addAndUpdatemdseDs/0",
              data:JSON.stringify(param),
              dataType: "json",
              contentType:"application/json",
              success: function(data){
                  //  console.log(data);
                  alert("保存成功");

                  resetTime(id);
                  init();
              }
          });




  }
function resetTime(id){
    var formdata = {};

    formdata.dealerId=id;
    $.ajax({
        type: "POST",
        url: "http://10.32.17.125:8080/dop/mdseManager/getMdseDsMaxUpdateTime/0",
        data:JSON.stringify(formdata),
        dataType: "json",
        contentType:"application/json",
        success: function(data){
            maxUpdate= data.result.maxUpdate ;

        }
    });
}
function unique(arr) {
    var ret = []
    var hash = {}

    for (var i = 0; i < arr.length; i++) {
        var item = arr[i]
        var key = typeof(item) + item
        if (hash[key] !== 1) {
            ret.push(item)
            hash[key] = 1
        }
    }

    return ret
}

function getEvent(){
    if(document.all) return window.event;
    func=getEvent.caller;
    while(func!=null){
        var arg0=func.arguments[0];
        if(arg0){
            if((arg0.constructor==Event || arg0.constructor ==MouseEvent) || (typeof(arg0)=="object" && arg0.preventDefault && arg0.stopPropagation)){
                return arg0;
            }
        }
        func=func.caller;
    }
    return null;
}
