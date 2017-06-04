<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName() + ":"+request.getServerPort()+path;
%>
<script type="text/javascript">
<!--
ns.role.addInRoleList = function(obj,id,name){
	if(obj.checked){
		var flag = true;
		$.each($("div[belong='roleIds']"),function (entryIndex,entry){
			if( $(entry).html()== id){
				flag = false;
			}
		});
		if(flag){
			$("#selectRoleList").append("<tr id='"+id+"'><td height='14px' align='center'>"+name+"<div style='display:none' belong='roleIds'>"+id+"</div><div style='display:none' belong='roleNames'>"+name+"</div></td><td height='14px' align='center'><div onclick='ns.role.deleteTr(this)' style='cursor: pointer;width:12px;height:12px; background-image: url(\"images/jquery/ui-icons_cd0a0a_256x240.png\");background-repeat: no-repeat;background-position: -99px -131px;'></div></td></tr>");
		}
	}else{
		$("#"+id).remove();
	}
}

ns.role.deleteTr = function(entry){
	$(entry).parent().parent().remove();
}
//-->
</script>
<div class="pageHeader"> 
	<div class="searchBar" style="height:40px;">
		<form onsubmit="return divSearch(this,'dialogRoleList');" action="<%=basePath %>/pages/system/user/dailogRoleList.action" method="post">
			<input type="hidden" name="relationId" value="${relationId}">
			<input type="hidden" name="queryType" value="${queryType}">
			<table class="searchContent">
				<tr>
					<td>
						角色
					</td>
					<td class="queryTd">
						<input class="queryInput" type="text" name="sysUser.fullname" value="${sysUser.fullname}"/>
					</td>
					<td>
						<button type="submit" class="listbutton">查询</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<form id="pagerForm" method="post" action="<%=basePath %>/pages/system/user/dialogRoleList.action">
	<input type="hidden" name="relationId" value="${relationId}">
	<input type="hidden" name="queryType" value="${queryType}">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${pageResult.pageSize}" />
</form>
<div class="panelBar">
	<div class="pages">
		<span>显示</span>
		<input type="hidden" name="numPerPage" value="20">
		<span>${pageResult.pageSize}条，共${pageResult.totalCount}条</span>
	</div>
	<div class="pagination" targetType="dialog" rel="add_all_user" totalCount="${pageResult.totalCount}" numPerPage="${pageResult.pageSize}" pageNumShown="0" currentPage="${pageResult.currentPage}"></div>
</div>
<form id="tabListForm" name="tabListForm">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="tableClass" style=" border-left:1px #ededed solid;">
<tbody>
	<thead>
		<tr>
			<th class="thClass" width="5%"></th>
			<th class="thClass">角色</th>
		</tr>
	</thead>
	<c:forEach items="${pageResult.content}" var="role" varStatus="status">
	     <c:if test="${status.count%2==0}">
	           	<tr target="id_column" rel="1" class='event'>
	           </c:if>
	           <c:if test="${status.count%2!=0}">
	           	<tr target="id_column" rel="1">
	           </c:if>
	          <td class="tdClass" width="5%"><input onclick="ns.role.addInRoleList(this,'${role.id}','${role.roleName}')" type="checkbox" class="checkbox" value="${puser.id}"></td>
	          <td class="tdClass">${role.roleName}</td>
	     </tr>
	 </c:forEach>
	</tbody>	
</table>
</form>