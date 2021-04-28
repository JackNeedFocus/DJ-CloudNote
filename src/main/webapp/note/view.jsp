<%--
  Created by IntelliJ IDEA.
  User: jackdeng
  Date: 2021/4/28
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-9">
    <div class="data_list">
        <div class="data_list_title">
            <span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;添加云记
        </div>
        <div class="container-fluid">
            <div class="container-fluid">
                <div class="row" style="padding-top: 20px;">
                    <div class="col-md-12">
                        <%-- 判断类型列表是否为空，如果为空，提示用户先添加类型 --%>
                        <c:if test="${empty typeList}">
                            <h2>暂未查询到云记类型！</h2>
                            <h4><a href="type?actionName=list">添加类型</a> </h4>
                        </c:if>
                        <c:if test="${!empty typeList}">
                            <form class="form-horizontal" method="post" action="note">
                                <div class="form-group">
                                    <label for="typeId" class="col-sm-2 control-label">类别:</label>
                                    <div class="col-sm-8">
                                        <select id="typeId" class="form-control" name="typeId">
                                            <option value="-1">请选择云记类别...</option>

                                            <c:forEach var="item" items="${typeList}">
                                                <c:choose>
                                                    <c:when test="${!empty resultInfo}">
                                                        <option  <c:if test="${resultInfo.result.typeId == item.typeId}">selected</c:if> value="${item.typeId}">${item.typeName}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option  <c:if test="${noteInfo.typeId == item.typeId}">selected</c:if> value="${item.typeId}">${item.typeName}</option>
                                                    </c:otherwise>
                                                </c:choose>

                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="noteId" value="28">
                                    <input type="hidden" name="act" value="save">
                                    <label for="title" class="col-sm-2 control-label">标题:</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" name="title" id="title" placeholder="云记标题" value="123">
                                    </div>
                                </div>

                                <%-- 富文本编辑器区域--%>
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">内容:</label>
                                    <div class="col-sm-10">
                                            <%-- 准备容器，加载富文本编辑器 --%>
                                        <textarea id="content" name="content">${noteInfo.content}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-4">
                                        <input type="submit" class="btn btn-primary" onclick="return saveNote();" value="保存">
                                        <font id="error" color="red"></font>
                                    </div>
                                </div>
                            </form>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //加载富文本编辑器到textarea容器
        $(function(){
            var ue = UE.getEditor('content');
        });

    </script>

</div>
