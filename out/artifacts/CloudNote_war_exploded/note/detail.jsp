<%--
  Created by IntelliJ IDEA.
  User: jackdeng
  Date: 2021/4/28
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-md-9">
    <div class="data_list">
        <div class="data_list_title">
            <span class="glyphicon glyphicon-eye-open"></span>&nbsp;查看云记
        </div>
        <div>


            <div class="note_title"><h2>${note.title}</h2></div>
            <div class="note_info">
                发布时间：『<fmt:formatDate value="${note.pubTime}" pattern="yyyy-MM-dd HH:mm"/> 』&nbsp;&nbsp;云记类别：${note.typeName}
            </div>
            <div class="note_content">
                <p>${note.content}</p>
            </div>
            <div class="note_btn">
                <button class="btn btn-primary" type="button" onclick="update(${note.noteId})">修改</button>
                <button class="btn btn-danger" type="button" onclick="del(${note.noteId})">删除</button>
            </div>



        </div>


    </div>

    <script>
        function update(data){
            window.location="note?actionName=view&noteId="+data;
        }

        function del(data){
            //使用sweet-alert
            swal({title: "删除提示",   //弹出框的title
                text: "确定删除吗？",  //弹出框里面的提示文本
                type: "warning",    //弹出框类型
                showCancelButton: true, //是否显示取消按钮
                confirmButtonColor: "#DD6B55",//确定按钮颜色
                cancelButtonText: "取消",//取消按钮文本
                confirmButtonText: "是的，确定删除！"//确定按钮上面的文档
            }).then(function(isConfirm) {
                $.ajax({
                    type:"post",
                    url:"note",
                    data:{
                        actionName:"delete",
                        noteId:noteId
                    },
                    success:function (code) {
                        // 判断是否删除成功
                        if (code == 1) {
                            // 跳转到首页
                            window.location.href = "index";
                        } else {
                            // 提示失败
                            swal("","<h3>删除失败！</h3>", "error");
                        }
                    }
                });
            });
        }
    </script>

</div>
