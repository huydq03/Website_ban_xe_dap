<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugin/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugin/signup.css"/>
</head>
<body>
<div class="container">
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <div class="alter alter-success text-success">
                                ${mess}
                            </div>
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Sign Up</h3>
                            <%--@elvariable id="users" type=""--%>
                            <frm:form method="POST"
                                      modelAttribute="users"
                                      action="${pageContext.request.contextPath}/sign-up"
                                      class="row g-3 needs-validation" >
                                <div class="col-md-4">
                                    <label for="validationCustom01" class="form-label">Username</label>
                                    <frm:input type="text" class="form-control" id="validationCustom01" path="username" />
                                    <div class="alter alter-danger text-danger">
                                            ${err_ma}
                                    </div>
                                    <frm:errors path="username" class="alter alter-danger text-danger"/>
                                </div>
                                <div class="col-md-8">
                                </div>
                                <div class="col-md-5">
                                    <label for="validationCustom04" class="form-label">Họ tên</label>
                                    <frm:input type="text" class="form-control" id="validationCustom04" path="fullname" />
                                    <frm:errors path="fullname" class="alter alter-danger text-danger"/>
                                </div>
                                <div class="col-md-7">
                                </div>

                                <div class="col-md-2">
                                    <label class="form-label">Giới tính</label>
                                    <br>
                                    <frm:radiobutton path="gender" value="1" checked="checked"/>Nam
                                    <frm:radiobutton path="gender" value="0"/>Nữ
                                </div>
                                <div class="col-md-4">
                                    <label for="validationCustom07" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="validationCustom07" name="phone" required>
                                </div>
                                <div class="col-md-6">
                                </div>
                                <div class="col-md-4">
                                    <label for="validationCustom08" class="form-label">Mật khẩu</label>
                                    <frm:input type="password" class="form-control" id="validationCustom08" path="password" />
                                </div>
                                <div class="col-md-8">
                                </div>
                                <div class="col-md-4">
                                    <label for="validationCustom08" class="form-label">Địa chỉ</label>
                                    <frm:input type="text" class="form-control" id="validationCustom08" path="address"
                                               value="${users.address}"/>
                                </div>

                                <div class="col-12" style="margin-top: 20px">
                                    <input type="submit" value="Save" class="btn btn-primary"/>
                                </div>
                            </frm:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="${pageContext.request.contextPath}/js/plugin/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugin/bootstrap.bundle.min.js"></script>
</body>
</html>