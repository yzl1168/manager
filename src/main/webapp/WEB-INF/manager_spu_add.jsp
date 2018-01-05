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
	$(function(){
		//获取一级菜单的json数据（使用jq）
		
/* 		$.getJSON("js/json/class1.js", function(data){
			$(data).each(function(i,item){
				$("#index_select_class_1").append("<option value="+item.id+">"+item.flmch1+"</option>");
			});
		}); */
		
		//获取一级菜单的json数据（使用combobox）
		
		$('#index_select_class_1').combobox({    
		    url:'js/json/class1.js',    
		    valueField:'id',    
		    textField:'flmch1' ,
		    //根据一级菜单的id获取二级菜单的json数据(combobox)
		    onSelect:function(){
		    	var class_1_id = $(this).combobox('getValue');
		    	$("#index_select_class_2").combobox({
		    		url:'js/json/class2_'+class_1_id+'.js',    
				    valueField:'id',    
				    textField:'flmch2' ,
				    onSelect:function(){
				    	$("#index_select_tm").combobox({
				    		url:"js/json/class1_"+class_1_id+"_tm.js",    
						    valueField:'id',    
						    textField:'ppmch'
				    	});
				    }
		    	});
		    }
		}); 
	});
	//根据一级菜单的id获取二级菜单的json数据(jq)
/* 	function index_selet_class_2_by_class_1_id(){
		var class_1_id = $("#index_select_class_1 option:selected").val();
		$.getJSON("js/json/class2_"+class_1_id+".js", function(data){
			$("#index_select_class_2").empty();
			$(data).each(function(i,item){
				$("#index_select_class_2").append("<option value="+item.id+">"+item.flmch2+"</option>");
			});
		});
		
		$.getJSON("js/json/class1_"+class_1_id+"_tm.js", function(data){
			$("#index_select_tm").empty();
			$(data).each(function(i,item){
				$("#index_select_tm").append("<option value="+item.id+">"+item.ppmch+"</option>");
			});
		}); 
	} */
	//添加商品图片
	function index_img_click(i){
			$("#index_file_"+i).click();
			
	}
	function showImg(i){
		var imgLength = $("#div_img img").length;
		if(i<=5 && imgLength<=5){
			var files = $("#index_file_"+i);
			var url = window.URL.createObjectURL(files[0].files[0]);
		 	$("#index_img_"+i).attr("src",url); 
		 	appendImg(i);
		 	$("#span_num").html(5-imgLength);
		}else{
			alert("最多只能上传五张图片！");
		}
		
	}
	function appendImg(i){
		var imgLength = $("#div_img img").length;
		if(i<5 && imgLength<5){
			$("#div_img").append("<img id=\"index_img_"+(i+1)+"\" onclick=\"index_img_click("+(i+1)+")\"  src=\"imge/upload_hover.png\" style=\"width:88px ; cursor:pointer\"/>");
			$("#div_img").append("<input id=\"index_file_"+(i+1)+"\" type=\"file\" name=\"files\" onchange=\"showImg("+(i+1)+")\" style=\"display:none\"/>");
			
		}
	}
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>spu商品发布</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<form action="spu_add.do" enctype="multipart/form-data" method="post">
			<div data-options="region:'north',split:true,border:false" style="height:50px"></div>
			<div data-options="region:'west',split:true,border:false" style="width:160px">
				一级分类菜单<br>
				<select  class="easyui-combobox" id="index_select_class_1" name="flbh1" onchange="index_selet_class_2_by_class_1_id()" style="width:100px">
					<option>请选择</option>
				</select>
				<br>
				二级分类菜单<br>
				<select  class="easyui-combobox" id="index_select_class_2" name="flbh2" style="width:100px">
					<option>请选择</option>
				</select>
				<br>
				商品菜单<br>
				<select  class="easyui-combobox" id="index_select_tm" name="pp_id" style="width:100px">
					<option>请选择</option>
				</select>
				<br>
			</div>
			<div data-options="region:'center',border:false">
				您最多还可以上传<span id="span_num">5</span>张图片
				<!-- 商品图片上传 -->
				<div id="div_img">
					<img id="index_img_1" onclick="index_img_click(1)" alt="" src="imge/upload_hover.png" style="width:88px ; cursor:pointer"/>
					<input id="index_file_1" type="file" name="files" onchange="showImg(1)" style="display:none"/>
				</div>
				
				</br>
				<!-- 商品信息 -->
				商品名称:<input type="text" name="shp_mch"/></br>
				商品描述:<input type="text" name="shp_msh"/><br>
				<button type="submit" >提交</button>
			</div>
		</form>
	</div>	
</body>
</html>