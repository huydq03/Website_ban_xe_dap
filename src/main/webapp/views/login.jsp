<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <title>Login 07</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugin/login.css">

</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10">
                <div class="wrap d-md-flex">
                    <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                        <div class="text w-100">
                            <h2>Welcome to login</h2>
                            <p>Don't have an account?</p>
                            <a href="/sign-up" class="btn btn-white btn-outline-white">Sign Up</a>
                        </div>
                    </div>
                    <div class="login-wrap p-4 p-lg-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign In</h3>
                            </div>
                            <div class="w-100">
                                <p class="social-media d-flex justify-content-end">
                                    <a href="#"
                                       class="social-icon d-flex align-items-center justify-content-center"><span
                                            class="fa fa-facebook"></span></a>
                                    <a href="#"
                                       class="social-icon d-flex align-items-center justify-content-center"><span
                                            class="fa fa-twitter"></span></a>
                                </p>
                            </div>
                        </div>
                        <div class="alter alter-danger text-danger">
                            ${mess}
                        </div>
                        <%--@elvariable id="users" type=""--%>
                        <frm:form
                                modelAttribute="users"
                                method="POST"
                                action="${pageContext.request.contextPath}/login"
                                class="signin-form">
                            <div class="form-group mb-3">
                                <label class="label">Username</label>
                                <frm:input type="text" class="form-control" placeholder="Username" path="username" />
                                <small>
                                    <frm:errors path="username" class="alter alter-danger text-danger"></frm:errors>
                                </small>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="password">Password</label>
                                <frm:input type="password" class="form-control" placeholder="Password" path="password"/>
                                <small>
                                    <frm:errors path="password" class="alter alter-danger text-danger"></frm:errors>
                                </small>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
<%--                                <frm:input path="" type="submit" value="Sign In"></frm:input>--%>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-50 text-left">
                                    <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                        <input type="checkbox" checked>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="w-50 text-md-right">
                                    <a href="#">Forgot Password</a>
                                </div>
                            </div>
                        </frm:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/js/plugin/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugin/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/plugin/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugin/main.js"></script>

</body>
</html>

