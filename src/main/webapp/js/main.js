$(function(){
    /**测试代码**/
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
    //Jquery循环
    /*$("ul.navbar-nav li").each(function(index){
     $(this).text(index);
     });*/
    /*var list=$("ul.navbar-nav li");
     for(var i=0;i<list.size();i++){
     list.get(i).text(i);
     }*/
    //$("select>option:selected").val();

    /**业务代码**/
    //找到所有panel并隐藏
    $("#mainBody>div.panel").hide();
    //默认显示第一个panel，也就是用户列表
    $("div.panel:eq(0)").show();
    //配置导航条各模块菜单的点击事件
    $("ul.navbar-nav>li").click(function(){
        //找到当前菜单项的兄弟元素中有active类样式的菜单项，并移除active类样式
        $(this).siblings(".active").removeClass("active");
        //给自己加上active类样式
        $(this).addClass("active");
        //获取自己的下标
        var count=$(this).parent().children().index($(this));
        //隐藏所有panel
        $("#mainBody>div.panel").hide();
        //显示自己对应的panel
        $("div.panel:eq("+count+")").show();
    });
    //通过Ajax获取用户信息
    var getUserList=function(){
        var tempArr=[
            {id:1,userName:"柳明1",userId:"liuming1",password:"123456",age:31},
            {id:2,userName:"柳明2",userId:"liuming2",password:"123456",age:32},
            {id:3,userName:"柳明3",userId:"liuming3",password:"123456",age:33},
            {id:4,userName:"柳明4",userId:"liuming4",password:"123456",age:34},
            {id:5,userName:"柳明5",userId:"liuming5",password:"123456",age:35},
            {id:6,userName:"柳明6",userId:"liuming6",password:"123456",age:36}
        ];
        return tempArr;
    };
    //通过Ajax更新用户信息
    var updateUser=function(user){
        //提交user
        return true;
    };
    var inOptionIndex;          //当前操作的行下标
    var userList=getUserList(); //用户列表数据
    var tr=$("<tr></tr>")       //当以行对应的Jquery对象
        .append($("<td></td>"))
        .append($("<td></td>"))
        .append($("<td></td>"))
        .append($("<td></td>"))
        .append($("<td></td>")
            .append($("<button></button>")
                .text("修改")
                .addClass("btn btn-primary btn-xs")
                .click(function(){//修改按钮的点击事件
                    //显示修改表单
                    $("#panelUpdate").show();
                    //找到修改的行下标
                    inOptionIndex=$("#panelUser table tr").index($(this).parent().parent());
                    //根据下标获取数据对象
                    var currentUser=userList[inOptionIndex-1];
                    //将对象的值写入表单元素中
                    $("#panelUpdate form input[name='id']").val(currentUser.id);
                    $("#panelUpdate form input[name='userId']").val(currentUser.userId);
                    $("#panelUpdate form input[name='userName']").val(currentUser.userName);
                    $("#panelUpdate form input[name='age']").val(currentUser.age);
                }))
            .append($("<button></button>")
                .text("删除")
                .addClass("btn btn-primary btn-xs pull-right")
                .click(function () {//删除按钮的点击事件
                    $(this).parent().parent().remove();
                }))
        );
    //将用户数据集中的数据写入table
    for(var i=0;i<userList.length;i++){
        var user=userList[i];
        //复制tr对应的Jquery对象，事件也一起复制
        var tempTr=tr.clone(true);
        //分别找到对应列，写入数据
        tempTr.find("td:eq(0)").text(user.id);
        tempTr.find("td:eq(1)").text(user.userId);
        tempTr.find("td:eq(2)").text(user.userName);
        tempTr.find("td:eq(3)").text(user.age);
        //将设置好值得tr对象添加到table中
        $("#panelUser table").append(tempTr);
    }
    //保存按钮点击事件
    $("#btnSave").click(function () {
        //获取表单中用户修改后的数据
        var userName=$("#panelUpdate form input[name='userName']").val();
        var age=$("#panelUpdate form input[name='age']").val();
        //根据当前操作行的下标找到并更新用户数据集对应数据
        var user=userList[inOptionIndex-1];
        user.userName=userName;
        user.age=age;
        //提交服务器保存数据
        if(updateUser(user)){
            //将更新后的数据同步到对应的行
            var updateTr=$("#panelUser table tr:eq("+inOptionIndex+")");
            updateTr.find("td:eq(2)").text(userName);
            updateTr.find("td:eq(3)").text(age);
        };

        $("#panelUpdate").hide();
    });
});