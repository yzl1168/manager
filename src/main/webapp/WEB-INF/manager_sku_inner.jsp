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
	
	function show_value(i){
		$("#value_input_"+i).show();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach items="${list_object}" var="item" varStatus="attr_index">
		<input class="attr_input" onchange="show_value(${attr_index.index})" type="checkbox" name="attr_list[${attr_index.index }].id" value="${item.id}"/>${item.shxm_mch }
		<div style="display:none" id="value_input_${attr_index.index }">
		<c:forEach items="${item.list_value }" var="val" varStatus="val_index">
			
				<input type="radio" name="attr_list[${attr_index.index}].list_value[0].id" value="${val.id }"/>${val.shxzh}${val.shxzh_mch} 
			
		</c:forEach>
		</div>
		<br>
	</c:forEach>
	库存名称：<input type="text" name="sku_mch"/><br>
	库存数量：<input type="text" name="kc"/><br>
	库存价格：<input type="text" name="jg"/><br>
	库存地址：<input type="text" name="kcdz"/><br>
	
 
</body>
</html>