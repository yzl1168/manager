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
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function add_tabs(title,url){
		if(!$('#add_tabs').tabs('exists',title)){
			$.get(url,function(data){
				$('#add_tabs').tabs('add',{    
				    title:title,    
				    content:data,    
				    closable:true,    
				     
				});  
			})
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:180px;padding:10px;">
		<ul class="easyui-tree">
		<li>
			<span>系统管理</span>
			<ul>
				<li>
					<span><a href="javascript:add_tabs('商品spu发布','goto_spu_add/.do');">商品spu发布</a></span>
				</li>
				<li>
					<span><a href="javascript:add_tabs('商品属性添加','goto_attr/.do');">商品属性添加</a></span>
				</li>
				<li>
					<span><a href="javascript:add_tabs('商品sku发布','goto_sku_add/.do');">商品sku发布</a></span>
				</li>
			</ul>
		</li>
		
		<li data-options="state:'closed'">
			<span>缓存管理</span>
			<ul>
				<li>
					<span>Friend</span>
				</li>
				<li>
					<span>Wife</span>
				</li>
				<li>
					<span>Company</span>
				</li>
			</ul>
		</li>
	</ul>
	
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div id="add_tabs" class="easyui-tabs" style="height:530px">
			
		</div>
		
</body>

</body>
</html>