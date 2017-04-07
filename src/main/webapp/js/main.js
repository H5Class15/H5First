$(function(){

    //$("p").eq(1);==$("p:eq(1)");
    //$("p").hasClass("abc");==$("p.abc");


    //绑定事件
    /*$("#test1").click(function(){
     //改变样式
     //$("#test").css("background-color","red");
     //找到自己
     //$(this).css("background-color","red");
     //改变属性
     //$("img").attr("src","images/corner_01_b.gif");
     //$(this).addClass("btn").addClass("btn-primary");
     $(".navbar-brand").text("你好");

     });
     $("#test2").click(function(){
     //移除类样式
     $("#test1").removeClass("btn btn-primary");
     //设置值
     $("#txt1").val("改了");
     $("#txt2").text("又改了");
     $("#txt3").html("改改改");
     });*/
    $("#mainBody>div.panel").hide();
    $("div.panel:eq(0)").show();
    $("#btnLogin").click(function(){
        $(".navbar-brand").text("你好");
    });
    $("ul.navbar-nav>li").click(function(){
        $(this).siblings(".active").removeClass("active");
        $(this).addClass("active");
        var count=$(this).parent().children().index($(this));
        $("#mainBody>div.panel").hide();
        $("div.panel:eq("+count+")").show();
    });
    /*$("ul.navbar-nav li").each(function(index){
     $(this).text(index);
     });*/
    /*var list=$("ul.navbar-nav li");
     for(var i=0;i<list.size();i++){
     list.get(i).text(i);
     }*/
    //$("select>option:selected").val();
    var getUserList=function(){
        var tempArr=[
            {id:1,userName:"柳明1",userId:"liuming1",password:"123456",age:31},
            {id:2,userName:"柳明2",userId:"liuming2",password:"123456",age:32},
            {id:3,userName:"柳明3",userId:"liuming3",password:"123456",age:33}
        ];
        return tempArr;
    };
    var userList=getUserList();
    var tr=$("<tr></tr>")
        .append($("<td></td>"))
        .append($("<td></td>"))
        .append($("<td></td>"))
        .append($("<td></td>"))
        .append($("<td></td>")
            .append($("<button></button>")
                .text("修改")
                .addClass("btn btn-primary btn-xs")
                .click(function(){
                    $("#panelUpdate").show();
                    var index=$("#panelUser table tr").index($(this).parent().parent());
                    var currentUser=userList[index-1];
                    $("#panelUpdate form input[name='id']").val(currentUser.id);
                    $("#panelUpdate form input[name='userId']").val(currentUser.userId);
                    $("#panelUpdate form input[name='userName']").val(currentUser.userName);
                    $("#panelUpdate form input[name='age']").val(currentUser.age);
                }))
            .append($("<button></button>").text("删除").addClass("btn btn-primary btn-xs pull-right"))
        );
    for(var i=0;i<userList.length;i++){
        var user=userList[i];
        var tempTr=tr.clone(true);
        tempTr.find("td:eq(0)").text(user.id);
        tempTr.find("td:eq(1)").text(user.userName);
        tempTr.find("td:eq(2)").text(user.userId);
        tempTr.find("td:eq(3)").text(user.age);
        $("#panelUser table").append(tempTr);
    }
    $("#btnSave").click(function () {
        $("#panelUpdate").hide();
    });
});