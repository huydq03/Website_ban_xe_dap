<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="bi-pencil-square" viewBox="0 0 16 16">
        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
        <path fill-rule="evenodd"
              d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
    </symbol>
    <symbol id="bi-x-octagon-fill" viewBox="0 0 16 16">
        <path d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zm-6.106 4.5L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"/>
    </symbol>
    <symbol id="bi-plus-circle" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
    </symbol>
</svg>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Cập nhật danh mục</h1>
                </div>

                <%--@elvariable id="category" type=""--%>
                <frm:form method="POST"
                          modelAttribute="category"
                          action="${pageContext.request.contextPath}/admin/category/edit/${category.id}"
                          enctype="multipart/form-data"
                          class="row g-3 needs-validation">
                    <div class="col-md-3">
                        <label for="validationCustom01" class="form-label">Mã</label>
                        <frm:input type="text" class="form-control" id="validationCustom01" path="ma"
                                   value="${category.ma}"/>
                        <div><small><frm:errors path="name" class="error"/></small></div>
                    </div>
                    <div class="col-md-8">
                    </div>
                    <div class="col-md-3">
                        <label for="validationCustom02" class="form-label">Tên</label>
                        <frm:input type="text" class="form-control" id="validationCustom02" path="name"
                                   value="${category.name}"/>
                        <div><small><frm:errors path="name" class="error"/></small></div>
                    </div>
                    <br>
                    <div class="col-md-8">
                    </div>
                    <div class="col-md-3">
                        <label for="validationCustom03" class="form-label">Mô tả</label>
                        <frm:input type="text" class="form-control" id="validationCustom03" path="descriptions"
                                   value="${category.descriptions}"/>
                    </div>
                    <br>

                    <div class="col-12" style="margin-top: 20px">
                        <button class="btn btn-primary">Cập nhật</button>
                    </div>
                </frm:form>
            </div>
            <!-- End of Main Content -->
        </div>
    </div>
</div>
<!-- End of Page Wrapper -->
