<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>电子图书列表</title>
    <style type="text/css">
        tbody>tr:nth-child(odd){
            background: #CCF6CE;
        }
    </style>
    <!-- 引入bootstrap分页 -->
    <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
    <script>
        $(function() {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage: ${requestScope.pageInfo.pageNum },
                totalPages: ${requestScope.pageInfo.pages },
                pageUrl: function(type, page, current) {
                    return 'book/getBookList.do?pageNum=' + page;
                },
                itemTexts: function(type, page, current) {
                    switch(type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                }
            });
        });
    </script>
</head>
<body>
<center>
    <h3>电子图书列表</h3>
    <span style="position: relative;left:-200px">
        图书分类：
        <select name="type">
            <option value="0">全部</option>
        </select>
        <button id="search">查询</button>
    </span>
    <span style="position: relative;right:-200px">
        <button id="addBook">新增电子图书</button>
    </span>
    <table width="900px" border="1px" cellspacing="0px">
        <thead>
            <tr>
                <th>图书编号</th>
                <th>图书名称</th>
                <th>图书摘要</th>
                <th>上传人</th>
                <th>上传时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pageInfo.list}" var="book">
                <tr>
                    <td>${book.book_id}</td>
                    <td>${book.book_name}</td>
                    <td>${book.book_detail}</td>
                    <td>${book.book_publisher}</td>
                    <td><fmt:formatDate value="${book.book_pub_time}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td>
                        <a href="javascript:void(0)" class="update" book_id="${book.book_id}">修改</a>
                        &nbsp;&nbsp;
                        <a href="javascript:void(0)" class="del">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- 把分页搞出来 -->
    <ul id="pagination"></ul>
</center>
   <%--图书分类的ajax--%>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"<%=basePath %>/book/getBookTypeList.do",
            dataType:"JSON",
            type:"POST",
            success:function (rs) {
                var content="";
                 for(var i in rs){
                     var type_id=rs[i].type_id;
                     var type_name=rs[i].type_name;
                     content+=" <option value='"+type_id+"'>"+type_name+"</option>";
                 }
                 $("select[name=type]").append(content);
            }
        })
    });
    /*点击搜索按钮触发ajax*/
    $("#search").click(function () {
        $.ajax({
            url:"<%=basePath %>/book/getBookListByTypeId.do",
            dataType:"JSON",
            type:"POST",
            data:{
                "type_id":$("select[name=type]>option:selected").val()
            },
            success:function (rs) {
                var content="";
                for (var i in rs) {
                    var book_id=rs[i].book_id;
                    var book_name=rs[i].book_name;
                    var book_detail=rs[i].book_detail;
                    var book_publisher=rs[i].book_publisher;
                    var book_pub_time=rs[i].book_pub_time;
                    content+="<tr><td>"+book_id+"</td><td>"+book_name+"</td><td>"+book_detail+"</td><td>"+book_publisher+"</td><td>"+book_pub_time+"</td><td> <a href='javascript:void(0)' class='update'>修改</a>&nbsp;&nbsp;<a href='javascript:void(0)' class='del'>删除</a></td></tr>";
                }
               $("tbody").html(content);
            }
        })
    });
    /*点击新增按钮*/
    $("#addBook").click(function () {
        var type_id=$("select[name=type]>option:selected").val();
        window.open("<%=basePath%>/pages/admin/addEbook.jsp?type_id="+type_id,"","width=800,height=400,left=350,top=200,resizable:no");
    });
    //点击修改
    $(".update").click(function () {
        var book_id=$(event.target).attr("book_id");
        alert(11)
        $(function () {
            $("input[type=submit]").click(function () {
                var book_id = $("input[name=book_id]").val();
                $.ajax({
                    url:"/book/mutifyedBook.do",
                    dataType:"JSON",
                    type:"POST",
                    data:{
                        "book_id":book_id
                    },
                    success:function (rs) {
                        if(rs){
                            window.open("<%=basePath%>/pages/admin/updateEbook.jsp?book_id="+book_id,"","width=800,height=400,left=350,top=200,resizable:no");
                        }
                        else {
                            alert("跳转失败")
                        }
                    }
                })
            });
        })
    });
</script>
</body>
</html>
