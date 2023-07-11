<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><tiles:insertAttribute name="title"/></title>
    <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugin/product_home.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugin/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom/style.css" />
</head>
<body>
<div class="container" style="margin-top: 0px;margin-bottom: 0px;">
    <%--    header--%>
        <tiles:insertAttribute name="header"/>
    <%--    end header--%>
    <div id="content" class="my-5">
        <tiles:insertAttribute name="body"/>
    </div>
<%--    foooter--%>
        <tiles:insertAttribute name="footer"/>
<%--    end footer--%>
</div>

<script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/plugin/product_filters.js'></script>
<script type='text/javascript'>var myLink = document.querySelector('a[href="#"]');
myLink.addEventListener('click', function (e) {
    e.preventDefault();
});</script>

</body>
</html>