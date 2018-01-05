<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<!-- <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> -->
<script type="text/javascript">
	var index = 0;
	function add_attr_table(){
		index++;
		var a = '</br><table border="1" cellspacing="0" id="attr_table_'+(index)+'">';
		var b = '<tr><td>属性名：<input type="text" name="attr_list['+(index)+'].shxm_mch"/></td><td><a href="javascript:add_attr_table_tr('+(index)+')">添加属性值</a></td><td>操作</td></tr>';
		var c = '<tr><td>属性值：<input type="text" name="attr_list['+(index)+'].list_value[0].shxzh"/></td><td>值名：<input type="text" name="attr_list['+(index)+'].list_value[0].shxzh_mch"/></td><td>删除</td></tr>';
		var d = '</table>';
		$("#attr_table_"+(index-1)).after(a+b+c+d);
	}
	
	function add_attr_table_tr(table_index){
		var tr_size = $("#attr_table_"+table_index+" tr").length;
		var a = '<tr><td>属性值：<input type="text" name="attr_list['+(table_index)+'].list_value['+(tr_size-1)+'].shxzh"/></td><td>值名：<input type="text" name="attr_list['+(table_index)+'].list_value['+(tr_size-1)+'].shxzh_mch"/></td><td>删除</td></tr>';
		$("#attr_table_"+table_index).append(a);	
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加属性</title>
</head>
<body>
	<c:if test="${success==1}">
		${class_2_name }的属性添加成功！</br>
	</c:if>
	
	商品名称：${class_2_name }</br>
	<form action="class_2_attr_add.do" method="post">
		<input type="hidden" name="class_2_name" value="${class_2_name }"/>
		<input type="hidden" name="class_2_id" value="${class_2_id }"/>
		<a href="javascript:add_attr_table();">添加属性</a>
		<table border="1" cellspacing="0" id="attr_table_0">
			<tr>
				<td>属性名：<input type="text" name="attr_list[0].shxm_mch"/></td>
				<td><a href="javascript:add_attr_table_tr(0);">添加属性值</a></td>
				<td>操作</td>
			</tr>
			<tr>
				<td>属性值：<input type="text" name="attr_list[0].list_value[0].shxzh"/></td>
				<td>值名：<input type="text" name="attr_list[0].list_value[0].shxzh_mch"/></td>
				<td>删除</td>
			</tr>
		</table>
		
		
		<button type="submit">提交</button>
	</form>
	
</body>
</html>