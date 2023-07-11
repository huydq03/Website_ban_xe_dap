<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="menu-top">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/upload/logo1.png" alt=""/>
            </a>

            <form class="d-flex" role="search">
                <input
                        class="form-control me-2 search-btn"
                        type="search"
                        placeholder="Search"
                        aria-label="Search"
                />
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <c:if test="${users != null}">
                        <li class="nav-item">
                            <a class="nav-link">${users.fullname}</a>
                        </li>
                    </c:if>
                    <c:if test="${users == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                        </li>
                    </c:if>
                    <!-- ng-show="!successLogin" -->
                    <%--                        <li class="nav-item dropdown">--%>
                    <%--                            <a--%>
                    <%--                                    class="nav-link dropdown-toggle"--%>
                    <%--                                    href="#"--%>
                    <%--                                    role="button"--%>
                    <%--                                    data-bs-toggle="dropdown"--%>
                    <%--                                    aria-expanded="false">Trang của tôi</a>--%>

                    <%--                            <ul class="dropdown-menu">--%>
                    <%--                                <li><a class="dropdown-item" href="#ho-so">Hồ sơ</a></li>--%>
                    <%--                                <li>--%>
                    <%--                                    <a class="dropdown-item" href="#ho-so/doi-mat-khau">Đổi mật khẩu</a>--%>
                    <%--                                </li>--%>
                    <%--                                <li>--%>
                    <%--                                    <a class="dropdown-item" href="#ho-so/mua-hang">Lịch sử mua hàng</a>--%>
                    <%--                                </li>--%>
                    <%--                                <li>--%>
                    <%--                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>--%>
                    <%--                                </li>--%>
                    <%--                                <div class="dropdown-divider"></div>--%>
                    <%--                                <li>--%>
                    <%--                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/login">Quản trị viên</a>--%>
                    <%--                                </li>--%>
                    <%--                            </ul>--%>
                    <%--                        </li>--%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            Trang của tôi
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            <a class="dropdown-item" href="#">
<%--                                <a href="${pageContext.request.contextPath}?language=vi">--%>
<%--                                    <img  alt="" src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/vi.png" width="10px" height="10px">--%>
<%--                                </a>--%>
<%--                                <a href="${pageContext.request.contextPath}?language=en">--%>
<%--                                    <img alt="" src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/en.png" width="10px" height="10px"  >--%>
<%--                                </a>--%>
                            </a>
                            <div class="dropdown-divider"></div>
                            <c:if test="${users.role==2}">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/login">Quản trị
                                    viên</a>
                            </c:if>
                            <c:if test="${users.role!=2}">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">Quản
                                    trị viên</a>
                            </c:if>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/cart/index">Giỏ hàng</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="menu-nav">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/home"><s:message
                                code="label.home.home"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/product/list">Sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#gioi-thieu">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tin-tuc">Tin tức</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#lien-he">Liên hệ</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>