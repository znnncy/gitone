
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
<div id="cha">
    <a href="javascript:addoredit(1)" class="btn btn-success">新增信息</a>
    <a href="javascript:addoredit(2)" class="btn btn-success">修改信息</a>
    <a href="javascript:del(null)" class="btn btn-success">批量删除</a>
    <button type="button" class="btn btn-default" onclick="searchUser()">查询</button>
    </br>
    <form id="where">
        <div class="form-group">
            姓名:<input type="text"  id="username" name="sname" placeholder="姓名">
        </div>
        <div class="form-group">
            年龄:<input type="text"  name="begin" id="begin">--<input type="text"  name="end" id="end">
        </div>
        <div class="form-group">
            爱好:<input type="checkbox"  name="shobbying" value="1">爬山
            <input type="checkbox"  name="shobbying" value="2">跑步
            <input type="checkbox"  name="shobbying" value="3">敲代码
        </div>
    </form>
</div>

<table id="table" class="table"></table>

<script type="text/javascript">
    function addoredit(ii){
        var title="";
        var href="";

        if(ii==2){

            var arr=$("#table").bootstrapTable('getSelections');

            if(arr.length!=1){

                alert("请选择一行")

                return ;

            }else{

                id=arr[0].sid;
            }

            title="修改信息";
            &lt;%&ndash; href='<%=path%>/querypersonbyId.do?id='+id; &ndash;%&gt;

            BootstrapDialog.show({
                type : BootstrapDialog.TYPE_SUCCESS,
                title :title,
                message : $("<div></div>").load("<%=path%>/querystudentbyId.do?id="+id),
                size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
                buttons : [ {// 设置关闭按钮
                    label : '关闭',
                    action : function(dialogItself) {
                        dialogItself.close();
                    },
                },{
                    label : '保存',
                    action : function(dialogItself) {
                        var formData = new FormData(document.getElementById("student"));
                        alert(formData)
                        $.ajax({
                            url:"<%=request.getContextPath()%>/addStudent.do",
                            type:"post",
                            data:formData,
                            dataType:"json",
                            async:false,
                            cache: false,
                            contentType: false,
                            processData: false,
                            success:function(data){
                                if(data.success){
                                    dialogItself.close();
                                    $("#table").bootstrapTable("refresh",{pageNumber:1});
                                }else{
                                    alert(data.msg);
                                }
                            }

                        })
                    }
                }
                ]
            });

        }else if(ii==1){

            title="新增信息";

            BootstrapDialog.show({
                type : BootstrapDialog.TYPE_SUCCESS,
                title :title,
                message : $("<div></div>").load("add.jsp"),
                size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
                buttons : [ {// 设置关闭按钮
                    label : '关闭',
                    action : function(dialogItself) {
                        dialogItself.close();
                    },
                },{
                    label : '保存',
                    action : function(dialogItself) {
                        var formData = new FormData(document.getElementById("student"));
                        $.ajax({
                            url:"<%=request.getContextPath()%>/addStudent.do",
                            type:"post",
                            data:formData,
                            dataType:"json",
                            async:false,
                            cache: false,
                            contentType: false,
                            processData: false,
                            success:function(data){
                                if(data.success){
                                    dialogItself.close();
                                    $("#table").bootstrapTable("refresh",{pageNumber:1});
                                }else{
                                    alert(data.msg)
                                }
                            }

                        })
                    }
                }
                ]
            });
        }

    }
</script>


<script type="text/javascript">

    $("#table").bootstrapTable({
        url:"<%=request.getContextPath()%>/toShow.action",//获取数据的请求路径
        columns:[//绑定数据
            {checkbox:true},
            {field:"userid",title:"编号"},
            {field:"username",title:"姓名"},
            {field:"usersex",title:"性别",align:"center",formatter:function(value,row,index){
                if(value==1){
                    return "男";
                }else{
                    return "女";
                }
            }},
            {field:"userage",title:"年龄"},
            {field:"userhobby",title:"爱好",formatter:function(value,row,index){
                var arr=value.split(",");
                var ss="";
                for (var i = 0; i < arr.length; i++) {
                    if(arr[i]==1){
                        ss+="爬山"+" ";
                    }else if(arr[i]==2){
                        ss+= "跑步"+" ";
                    }else if(arr[i]==3){
                        ss+="敲代码";

                    }
                }
                return  ss;
            }},
            {field:"userbirthday",title:"生日",formatter:function(value,row,index){
                return new Date(value).toLocaleString();
            }},
            {field:"useraddr",title:"地址"},
            {field:"userphoto",title:"照骗",formatter:function(value,row,index){
                if(value != null){
                    return '<img width="40px" height="40px" src="/firstproject'+value+'"/>';
                }else{
                    return "";
                }
            }},
            {field:"userinfo",title:"简介"},

            {field:"e",title:"操作",formatter:function(value,row,index){
                return "<input type='button' value='删除' onclick='del("+row.userid+")'>";
            }}

        ],
        pagination:true,//显示分页条
        pageNumber:1,//初始化 页数
        pageSize:4,//初始化 条数
        pageList:[4,10,15],//初始化 可选择的条数
        paginationLoop:false,//关闭分页的无限循环
        height:530,//高度
        undefinedText:"-",//有数据为空时 显示的内容
        striped:true,//斑马线
        sortName:"userbirthday",//排序的字段
        sortOrder:"desc",//排序的方式 desc或asc
        //onlyInfoPagination:true,设置true时  只显示总条数
        //selectItemName:"name",
        //smartDisplay:false,
        // search:true,//启用搜索框
        //strictSearch:true,//设置精确匹配 还是模糊匹配     默认模糊匹配false
        //showFooter:true,//表格底部角
        showColumns:true,//显示选择展示列的按钮
        showRefresh:true,//刷新按钮
        showToggle:true,//切换显示格式
        showPaginationSwitch:true,//展示所有数据 和分页数据的切换按钮
        //detailView:true,//列的详细页
        /*  detailFormatter:function(index,row){
             //格式化详细页
             return '<a href="#">'+row.p_name+'</a>';
         }, */
        searchAlign:"left",//搜索框的显示位置
        paginationHAlign:"left",//分页按钮的显示位置
        paginationDetailHAlign:"right",//总页数 和条数的显示位置
        paginationPreText:"上一页",//设置上一页显示的文本
        paginationNextText:"下一页",//设置下一页显示的文本
        clickToSelect:true,//选中行  默认选中  单选或复选
        toolbar:"#cha",
        sidePagination:"server",
        method:"post",
        contentType:"application/x-www-form-urlencoded",
        //传递参数（*）
        queryParams: function(params) {
            var whereParams = {
                /*
                    分页  自定义的参数         默认传 limit（展示几条）    offset（从第几条开始    起始条数）
                */
                "student":$("#where").serialize(),
                "limit":params.limit,
                "offset":params.offset,
            }
            return whereParams;
        }

    })
    function searchUser(){
        var shobbying="";
        /* var hobby=new Array(); */
        $("input[name='shobbying']:checked").each(function(){
            shobbying+=","+$(this).val();
        })
        shobbying = shobbying.substring(1);
        /* hobby.push(shobbying);  */
        $("#table").bootstrapTable('refresh',
            {query: {
                "sname":$("#sname").val(),
                "begin":$("#begin").val(),
                "end":$("#end").val(),
                "shobbying":shobbying,
            }}
        );
    }

</script>

<!-- 删除 -->
<script type="text/javascript">
    function del(id){

        var ids="";

        if(id!=null){

            ids=id;

        }else{

            var arr=$("#table").bootstrapTable('getSelections');

            for (var i = 0; i < arr.length; i++) {

                ids+=","+arr[i].sid;
            }

            ids=ids.substring(1);
        }

        $.ajax({
            url:"<%=path%>/deleteStudent.do",
            type:"post",
            data:{"ids":ids},
            dataType:"json",
            success:function(data){
                if(data.success){

                    $("#table").bootstrapTable("refresh",{pageNumber:1});

                }else{
                    alert(data.msg);
                }

            }

        })
    };
</script>--%>

  <%--  id的值是：${userid}--%>
  <a href="<%=request.getContextPath()%>/add.jsp">新增</a>
  <table border="1" cellspacing="0">

      <tr>
          <td>用户id</td>
          <td>用户名</td>
          <td>性别</td>
          <td>年龄</td>
          <td>地址</td>
          <td>爱好</td>
          <td>生日</td>
          <td>简介</td>
          <td>图片</td>

      </tr>
      <c:forEach items="${list}" var="u">
      <tr>
          <td>${u.userid}</td>
          <td>${u.username}</td>
          <td>${u.usersex==1?"男":"女"}</td>
          <td>${u.userage}</td>
          <td>${u.useraddr}</td>
          <td>
              ${u.userhobby.contains('1')?"爬山":""}
              ${u.userhobby.contains('2')?"跑步":""}
              ${u.userhobby.contains('3')?"敲代码":""}

          </td>
          <td>${u.userbirthday}</td>
          <td>${u.userinfo}</td>
          <td><img src="${u.userphoto}" alt="" width="40px" height="40px"></td>
      </tr>
      </c:forEach>
  </table>

</body>
</html>
