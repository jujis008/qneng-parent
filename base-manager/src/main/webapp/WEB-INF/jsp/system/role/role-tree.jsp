<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title></title>
<link href="<%=basePath%>resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/css/common.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>resources/plugins/zTree/metroStyle.css"/>
    <script src="<%=basePath%>resources/js/common/common.js"></script>
    <script src="<%=basePath%>resources/plugins/zTree/jquery.ztree.all.js"></script>
    <script src="<%=basePath%>resources/js/common/bootstrap.js"></script>
    <script src="<%=basePath%>resources/js/role.js"></script>
    
</HEAD>

<BODY>
<div class="panel_con main_con">
    <div class="current_position">
        <ol>
            <li class="glyphicon glyphicon-folder-open icon_home"></li>
            <li>系统管理&nbsp;&nbsp;&gt; </li>
            <li class="active">角色管理</li>
        </ol>
    </div>
    <div class="panel panel-default main_contents">
		    <div class="zTreeDemoBackground">
		        <ul id="treeDemo" class="ztree"></ul>
		    </div>
	</div>
</div>
<div class="modal fade" id="editorDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog application_dialog">
        <div class="modal-content" id="editorModal">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">编辑角色</h4>
            </div>
            <div class="modal-body1" style="padding: 20px;">
                <table cellspacing="0" width="100%" class="modifyTable">
                    <tr>
	                    <th>角色名称：</th>
	                    <td>
	                        <input type="text" class="form-control input_common300" id="name" placeholder="角色名称">
	                        <input type="hidden" class="form-control input_common" id="id">
	                        <input type="hidden" class="form-control input_common" id="parentId">
	                    </td>
	                </tr>
                    <tr>
                        <th>角色描述：</th>
                        <td>
                            <input type="text" class="form-control input_common300" id="desc" placeholder="角色描述">
                        </td>
                    </tr>
                </table>
            </div>
            <div id="strategyTextView" style="display:none;">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary J_sure" id="updContent">确定</button>
                <button type="button" class="btn btn-primary J_add_sure none">确定</button>
                <button type="button" class="btn btn-default J_close_sure" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 弹出框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary J_delete_sure">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 弹出框 -->
<div class="modal fade" id="privilege" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">分配权限</h4>
            </div>
            <div class="modal-body2">
				<div class="zTreeDemoBackground">
		        	<ul id="privilegeTree" class="ztree"></ul>
		    	</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary J_privilege_sure none">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</BODY>
</HTML>