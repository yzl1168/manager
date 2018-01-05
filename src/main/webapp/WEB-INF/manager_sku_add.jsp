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
	//获取一级菜单的json数据(jq)
 	$.getJSON("js/json/class1.js", function(data){
		$(data).each(function(i,item){
			$("#sku_select_class_1").append("<option value="+item.id+">"+item.flmch1+"</option>");
		});
	}); 
	//获取一级菜单的json数据(combobox)
/* 	$('#sku_select_class_1').combobox({    
	    url:'js/json/class1.js',    
	    valueField:'id',    
	    textField:'flmch1' ,
	    //根据一级菜单的id获取二级菜单的json数据(combobox)
	    onSelect:function(){
	    	var class_1_id = $(this).combobox('getValue');
	    	$("#sku_select_class_2").combobox({
	    		url:'js/json/class2_'+class_1_id+'.js',    
			    valueField:'id',    
			    textField:'flmch2' ,
			    onSelect:function(){
			    	var class_2_id = $(this).combobox('getValue');
			    	$("#sku_select_tm").combobox({
			    		url:"js/json/class1_"+class_1_id+"_tm.js",    
					    valueField:'id',    
					    textField:'ppmch',
						onSelect:function(){
							var pp_id = $(this).combobox('getValue');
							
						}
			    	});
			    }
	    	});
	    }
	}); 
	*/
	}); 
	//根据一级菜单的id获取二级菜单的json数据
	function sku_selet_class_2_by_class_1_id(){
		var class_1_id = $("#sku_select_class_1 option:selected").val();
		$.getJSON("js/json/class2_"+class_1_id+".js", function(data){
			$("#sku_select_class_2").empty();
			$("#attr_show_attr_value").empty();
			$(data).each(function(i,item){
				$("#sku_select_class_2").append("<option value="+item.id+">"+item.flmch2+"</option>");
			});
		});
		
		$.getJSON("js/json/class1_"+class_1_id+"_tm.js", function(data){
			$("#sku_select_tm").empty();
			$(data).each(function(i,item){
				$("#sku_select_tm").append("<option value="+item.id+">"+item.ppmch+"</option>");
			});
		}); 
	} 
	function sku_get_spu_by_class_2_id_tm_id(){
		var class_2_id =$("#sku_select_class_2").val() ;
		var pp_id = $("#sku_select_tm").val();
		
		$.post("get_spu_by_class_2_id_tm_id.do",{"class_2_id":class_2_id,"pp_id":pp_id},
				function(data){
				$("#sku_select_product").empty(); 
					$(data).each(function(i,item){
						$("#sku_select_product").append("<option value="+item.id+">"+item.shp_mch+"</option>");
					});
		});
	}
	//根据二级分类的id获取属性和属性值
	function sku_get_attr_value_by_class_2_id(class_2_id){
		$("#attr_show_attr_value").empty();
		$.post(
			 "get_sku_attr_value_by_class2_id.do",
			 {"class_2_id" : class_2_id},
			 function(data){
				$("#sku_show_attr_value").html(data);
			}
		);
	}
	function check(){
		if(($("#sku_select_class_2").val())==null){
			alert("请选择二级分类");
			return false;
		}else if($("#sku_select_product").val()==null){
			alert("请选择商品");
			return false;
		}else{
			return true;
		}
		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		 <form action="add_sku.do" method="post" onsubmit="return check();">
				<div data-options="region:'north',split:true,border:false" style="height:50px"></div>
				<div data-options="region:'west',split:true,border:false" style="width:160px">
						一级分类菜单<br>
						<select id="sku_select_class_1" name="flbh1" onchange="sku_selet_class_2_by_class_1_id()" style="width:100px">
							
						</select><br>
						二级分类菜单<br>
						<select id="sku_select_class_2" name="flbh2" onchange="sku_get_attr_value_by_class_2_id(this.value)" style="width:100px">
							
						</select><br>
						商品菜单<br>
						<select id="sku_select_tm" name="pp_id" onchange="sku_get_spu_by_class_2_id_tm_id()" style="width:100px">
							
						</select><br>
						商品详情菜单<br>
						<select id="sku_select_product" name="id" style="width:100px">
							
						</select>
				</div>
				<div data-options="region:'center',border:false">
						<div id="sku_show_attr_value"></div>
						<input type="submit" value="添加sku"/>
				</div>
		</form>
	</div>
</body>
</html>