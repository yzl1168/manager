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
/* 			$.getJSON("js/json/class1.js", function(data){
				$(data).each(function(i,item){
					$("#attr_select_class_1").append("<option value="+item.id+">"+item.flmch1+"</option>");
				});
			}); */
			
			//获取一级菜单的json数据(combobox)
			$("#attr_select_class_1").combobox({
				url:'js/json/class1.js',    
			    valueField:'id',    
			    textField:'flmch1' ,
			    onSelect:function(){
			    	var class_1_id = $(this).combobox('getValue');
			    	$("#attr_select_class_2").combobox({
			    		url:'js/json/class2_'+class_1_id+'.js',    
					    valueField:'id',    
					    textField:'flmch2',
					    onSelect:function(){
					    	var class_2_id = $(this).combobox('getValue');
					    	//根据二级分类的中的id值，获取属性
					    	$("#attr_show_attr_value").datagrid({
					    		method:'post',
					    		url:'get_attr_value_by_class2_id_easyui.do',
					    		queryParams:{'class_2_id':class_2_id},
					    	    columns:[[ //显示属性  
					    		           {field:'shxm_mch',title:'属性名称',width:120},
					    		           //显示属性值
					    		           {field:'list_value',title:'属性值组',width:260,
					    		        	   formatter: function(value,row,index){
						    		   				var value_name = "";
						    		   				$(value).each(function(i,item){
						    		   					value_name=value_name+"/"+item.shxzh+item.shxzh_mch;
						    		   				});
						    		   				return value_name;
					    		        	   }   
					    		           	
					    		           },
					    		           {field:'chjshj',title:'创建时间',width:260,
					    		        	   //对创建时间字段进行格式化
					    		        	   formatter: function(value,row,index){
					    		   				var time_templet = new Date(value);
					    		   				return time_templet.toLocaleString();
					    		   			}
   
					    		           } 
					    		       ]]
					    	});
					    	/* $.post(
									 "get_attr_value_by_class2_id.do",
									 {"class_2_id" : class_2_id},
									 function(data){
										$("#attr_show_attr_value").html(data);
									}
								); */
					    }
			    	})
			    }
			});
			
		});
		//根据一级菜单的id获取二级菜单的json数据
/* 		function attr_selet_class_2_by_class_1_id(){
			var class_1_id = $("#attr_select_class_1 option:selected").val();
			$.getJSON("js/json/class2_"+class_1_id+".js", function(data){
				$("#attr_select_class_2").empty();
				$(data).each(function(i,item){
					$("#attr_select_class_2").append("<option value="+item.id+">"+item.flmch2+"</option>");
				});
			});
			
		} */
		//根据二级分类的中的id值，获取属性
		/* function attr_get_attr_value_by_class2_id(class_2_id){
			$("#attr_show_attr_value").empty();
			$.post(
				 "get_attr_value_by_class2_id.do",
				 {"class_2_id" : class_2_id},
				 function(data){
					$("#attr_show_attr_value").html(data);
				}
			);
		} */
		//将二级菜单的id和值传递到属性添加页面
		function goto_attr_add(){
			var class_2_id = $("#attr_select_class_2").combobox('getValue');
			var class_2_name =$("#attr_select_class_2").combobox('getText');
			if(class_2_id){
				//window.open("goto_class_2_attr_add/"+class_2_id+"/"+class_2_name+".do");
				add_tabs('商品属性列表','goto_class_2_attr_add/'+class_2_id+'/'+class_2_name+'.do');
			}else{
				alert("请选择要添加的商品类别！");
			}
		}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台商品属性添加</title>
</head>
<body>
 	<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:true,border:false" style="height:50px"></div>
				<div data-options="region:'west',split:true,border:false" style="width:160px">
					一级分类菜单<br>
					<select class="easyui-combobox" id="attr_select_class_1" name="flbh1" onchange="attr_selet_class_2_by_class_1_id()" style="width:100px">
						<option>请选择</option>
					</select><br>
					二级分类菜单<br>
					<select class="easyui-combobox" id="attr_select_class_2" name="flbh2" onchange="attr_get_attr_value_by_class2_id(this.value)" style="width:100px">
						<option>请选择</option>
					</select> <br>
				</div>
				<div data-options="region:'center',border:false">
						<div id="attr_show_attr_value" class="easyui-datagrid"></div>
						<a href="javascript:goto_attr_add()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加商品属性</a>
				</div>
	</div>
</body>
</html>