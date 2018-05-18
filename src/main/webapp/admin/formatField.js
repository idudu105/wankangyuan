

$("#addFormatFieldSubmit").click(function (){
	
	//提交格式数据字段
	var ft_id = $("#ft_id").val();
	var is_meta = $("#add_ff_is_meta").val();
	var ff_name = $("#add_ff_ff_name").val();
	var type = $("#add_ff_type").val();
	var check_rule = $("#add_ff_check_rule").val();
	var enumerated = $("#add_ff_enumerated").val();
	var not_null = $("#add_ff_not_null").val();
	var is_view = $("#add_ff_is_view").val();
	var description = $("#add_ff_description").val();
	var error_msg = $("#add_ff_error_msg").val();
	
	$.ajax({
		url:"/wankangyuan/formatField/insertFormatField",
		type:"post",
		data:{
			ft_id:ft_id,
			is_meta:is_meta,
			ff_name:ff_name,
			type:type,
			check_rule:check_rule,
			enumerated:enumerated,
			not_null:not_null,
			is_view:is_view,
			description:description,
			error_msg:error_msg,
			uid:'1'
		},
		dataType:"json",
		success : function(data){
			if(data.result == true){
				alert("增加格式字段成功");
				window.location.href="/wankangyuan/admin/formatdata";
			}else{
				alert(data.message);
			}
		},
		error : function(){
			alert("联网失败");
		}
		
	});

});

$("#editFormatFieldSubmit").click(function(){
	//提交格式数据字段
	var edit_ff_ff_id = $("#edit_ff_ff_id").val();
	var is_meta = $("#edit_ff_is_meta").val();
	var ff_name = $("#edit_ff_ff_name").val();
	var type = $("#edit_ff_type").val();
	var check_rule = $("#edit_ff_check_rule").val();
	var enumerated = $("#edit_ff_enumerated").val();
	var not_null = $("#edit_ff_not_null").val();
	var is_view = $("#edit_ff_is_view").val();
	var description = $("#edit_ff_description").val();
	var error_msg = $("#edit_ff_error_msg").val();
	
	$.ajax({
		url:"/wankangyuan/formatField/updateFormatField",
		type:"post",
		data:{
			ff_id:edit_ff_ff_id,
			is_meta:is_meta,
			ff_name:ff_name,
			type:type,
			check_rule:check_rule,
			enumerated:enumerated,
			not_null:not_null,
			is_view:is_view,
			description:description,
			error_msg:error_msg,
			uid:'1'
		},
		dataType:"json",
		success : function(data){
			if(data.result == true){
				alert(data.message);
				window.location.href="/wankangyuan/admin/formatdata";
			}else{
				alert(data.message);
			}
		},
		error : function(){
			alert("联网失败");
		}
		
	});
});

//弹出删除格式数据字段确认悬浮窗的按钮
$("#deleteFormatFieldsButton").click(function (){
	
	//首先是获取所有选中的基本信息字段
	var ids = [];
	var source_field_checkbox=document.querySelectorAll('.format_field_checkbox');
	for(var i = 0 ;  i < source_field_checkbox.length ; i++){
		if(source_field_checkbox[i].checked == true){
			ids.push(source_field_checkbox[i].id);
		}
	}
	//进行ajax请求
	if(ids.length < 1){
		alert("请勾选待删除的格式类型字段！");
		return;
	}
	document.getElementById("deleteFormatFieldsConfirm").style.display="block";

});


//删除格式数据类型字段的确认提交按钮
$("#deleteFormatFieldsSubmit").click(function (){
	var ids = [];
	var source_field_checkbox=document.querySelectorAll('.format_field_checkbox');
	for(var i = 0 ;  i < source_field_checkbox.length ; i++){
		if(source_field_checkbox[i].checked == true){
			ids.push(source_field_checkbox[i].id);
		}
	}
	$.ajax({
		url:"/wankangyuan/formatField/deleteFormatField",
		type:"post",
		data:{
			ff_ids:ids.join(",")
		},
		dataType:"json",
		success : function(data){
			if(data.result == true){
				//进行删除成功后的刷新页面处理
				alert(data.message);
				window.location.href="/wankangyuan/admin/formatdata";

			}else{
				alert(data.message);
			}
		},
		error : function(){
			alert("联网失败");
		}	
	});
});


function exitEnter(){
	document.querySelectorAll('.endconfigK')[0].style.display="none";
}