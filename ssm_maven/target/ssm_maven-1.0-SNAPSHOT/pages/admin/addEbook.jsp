<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新增电子图书</title>
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/JsonHandler.js"></script>
</head>
<body>
<center>
    <form action="javascript:void(0)" id="form1">
        <table width="600px" width="400px" border="1px" cellspacing="0px">
            <tr>
                <td colspan="2"  align="center"><h3>新增电子图书</h3></td>
            </tr>
            <tr>
                <input type="hidden" name="type_id" value="${param.type_id}">
                <td>图书名称(*)：</td>
                <td><input type="text" name="book_name"></td>
            </tr>
            <tr>
                <td>图书摘要：</td>
                <td>
                    <textarea name="book_detail" cols="50" rows="5"></textarea>
                </td>
            </tr>
            <tr>
                <td>上传人：</td>
                <td><input type="text" name="book_publisher"></td>
            </tr>
            <tr>
                <td>上传时间：</td>
                <td>
                    <input type="text" name="book_pub_time">yyyy-MM-dd
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="提交">
                    &nbsp;&nbsp;
                    <input type="button" value="返回">
                </td>
            </tr>
        </table>
    </form>
</center>

<script type="text/javascript">
    $(function () {
         $("input[type=submit]").click(function () {
             var name=$("input[name=book_name]").val();
             if(name==""){
               window.alert("图书名称不能为空！")
             }else{
                 //将id=form1标签下的所有表单数据构建成JSON类型
                 var jsonStr=JSON.stringify($("#form1").serializeObject());
             $.ajax({
                 url:"/book/saveBook.do",
                 dataType:"JSON",
                 type:"POST",
                 data:jsonStr,
                 contentType:"application/json",
                 success:function (rs) {
                     if(rs){
                         //关闭当前页面
                         window.close();
                         //刷新list列表
                         window.opener.reload();
                     }else {
                         window.alert("添加失败！！");
                     }
                 }
             })
             }
         });
    });

</script>

</body>
</html>
