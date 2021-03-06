<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName() + ":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	$(function(){
		fSelfWidth = '${form.width}';
		fSelfHeight = '${form.height}';
		selfXjTitle = '${form.xjTitle}';
		selfWhTitle = '${form.whTitle}';
		xjUrl="<%=basePath%>/pages/resource/template/addComb.action?op=new&formId=${formId}";
		plscUrl="<%=basePath%>/pages/resource/template/deleteComb.action?model=${model}&formId=${formId}";
		ljscUrl="<%=basePath%>/pages/resource/template/logicDeleteComb.action?model=${model}&formId=${formId}";
		bcUrl = "<%=basePath%>/pages/resource/template/saveComb.action";
		bzUrl = "<%=basePath%>/pages/resource/compexshowListHelp.action?listId=${listId}";
		mrUrl = "<%=basePath%>/pages/resource/compexisDefault.action?mainTable=${model}&colName=tbl_isdefault&";
		ns.common.mouseForButton();
	});
	
	function loadPartition(){
		$("#partitionFormDiv").loadUrl("<%=basePath%>/pages/resource/partition/loadPartitionForm.action");
	}
	
	function addPartition(){
		$partition = $("#partitionForm");
		if (!$partition.valid()) {
			return false;
		}
		$("#partitionId").val("");
		if($('#domainId').val() == ""){
			alertMsg.warn("请先建立模板!");
		}else{
			var urlString = "<%=basePath%>/pages/resource/partition/save.action?templateId=" + $('#domainId').val();
			$.ajax({
				type:'post',
				url: urlString,
				data:$("#partitionForm").serialize(),
				success: function(data){
					loadPartitionList();
				}
			});
		}
	}
	
	function updatePartition(){
		$partition = $("#partitionForm");
		if (!$partition.valid()) {
			return false;
		}
		if($('#domainId').val() == ""){
			alertMsg.warn("请先建立模板!");
		}else{
			var urlString = "<%=basePath%>/pages/resource/partition/save.action?templateId=" + $('#domainId').val();
			$.ajax({
				type:'post',
				url: urlString,
				data:$("#partitionForm").serialize(),
				success: function(data){
					loadPartitionList();
				}
			});
		}
	}
	
	function deletePartition(){
		alertMsg.confirm("确定要删除吗?", {okCall:
			function(){
	        	var urlString = "<%=basePath%>/pages/resource/partition/del.action";
				$.ajax({
					type:'post',
					url: urlString,
					data:$("#partitionListForm").serialize(),
					success: function(data){
						loadPartition();
						loadPartitionList();
					}
				});
			}
		});
	}
	
	function loadPartitionList() {
		var urlString = "<%=basePath%>/pages/resource/partition/list.action?templateId=" + $('#domainId').val();
		$.ajaxSetup({async: false});
		$("#partitionListDiv").load(urlString);	
		initPagination();
		$.ajaxSetup({async: true});
	}
	
	function loadEditPartition(id){
		var urlString = "<%=basePath%>/pages/resource/partition/edit.action?templateId="+$('#domainId').val()+"&partitionId=" + id;
		$('#partitionFormDiv').load(urlString);	
	}
	
	function addPartitionPage(){
		$('#tabLiId').append('<li><span style="color:;font-family:&quot;&quot;;">分区</span></li>');
		$('#tabDivId').append('<div><div align="center" id="partitionFormDiv"></div><div align="center" id="partitionListDiv"></div></div>');
		loadPartition();
		loadPartitionList();
	}
</script>
</head>
<c:set var="listurl" value="/pages/resource/template/listComb.action"></c:set>
<c:set var="viewurl" value="/pages/resource/template/viewComb.action"></c:set>
<%@include file="/WEB-INF/view/core/commonList.jsp"  %>
</html>