<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--body--%>
<!--  -->
<div class="container trang-chu">
    <div class="slide-show">
        <div
                id="carouselExampleIndicators"
                class="carousel slide"
                data-bs-ride="carousel"
        >
            <div class="carousel-indicators">
                <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                ></button>
                <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="1"
                        aria-label="Slide 2"
                ></button>
                <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="2"
                        aria-label="Slide 3"
                ></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="2000" >
                    <img src="${pageContext.request.contextPath}/upload/banner-01.jpg" class="d-block" alt="..." style="width: 100%; height: 500px"/>
                </div>
                <div class="carousel-item" data-bs-interval="1500">
                    <img src="${pageContext.request.contextPath}/upload/banner-03.jpg" class="d-block" alt="..." style="width: 100%; height: 500px"/>
                </div>
                <div class="carousel-item" data-bs-interval="1500">
                    <img src="${pageContext.request.contextPath}/upload/banner-02.jpg" class="d-block" alt="..." style="width: 100%; height: 500px"/>
                </div>
            </div>
            <button
                    class="carousel-control-prev"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev"
            >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                    class="carousel-control-next"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next"
            >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <div class="san-pham-ban-chay">
        <h4 class="title-ban-chay">Sản phẩm bán chạy</h4>
        <%--                <div class="row">--%>
        <%--                    <div--%>
        <%--                            class="dataxe col-lg-3"--%>
        <%--                            ng-repeat="xd in danhSachXeDap | limitTo : 8 | orderBy : '-soLuongDaBan'"--%>
        <%--                    >--%>
        <%--                        <div class="card" style="width: 16rem">--%>
        <%--                            <a href="#/san-pham/detail/{{xd.id}}">--%>
        <%--                                <img--%>
        <%--                                        src="../../assets/img-pro/{{xd.anhXe}}"--%>
        <%--                                        class="card-img-top"--%>
        <%--                                        alt="..."--%>
        <%--                                />--%>
        <%--                            </a>--%>
        <%--                            <div class="card-body">--%>
        <%--                                <a href="#/san-pham/detail/{{xd.id}}">--%>
        <%--                                    <h6 class="card-title">{{xd.tenXe}}</h6>--%>
        <%--                                </a>--%>
        <%--                                <p class="card-text card-mota">--%>
        <%--                                    <small>{{xd.moTa}}</small>--%>
        <%--                                </p>--%>

        <%--                                <p>--%>
        <%--                                    <a href="#/gio-hang">--%>
        <%--                                        <button type="button" class="btn btn-outline-success">--%>
        <%--                                            + Giỏ hàng--%>
        <%--                                        </button>--%>
        <%--                                    </a>--%>
        <%--                                    <a href="#/san-pham/mua-ngay">--%>
        <%--                                        <button type="button" class="btn btn-outline-danger">--%>
        <%--                                            + Mua ngay--%>
        <%--                                        </button>--%>
        <%--                                    </a>--%>
        <%--                                </p>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
    </div>
    <%--            <div class="san-pham-moi">--%>
    <%--                <h4 class="title-moi-nhat">Sản phẩm mới</h4>--%>
    <%--                <div class="row">--%>
    <%--                    <div--%>
    <%--                            class="dataxe col-lg-3"--%>
    <%--                            ng-repeat="xd in danhSachXeDap | limitTo : -8 | orderBy : '-'"--%>
    <%--                    >--%>
    <%--                        <div class="card" style="width: 16rem">--%>
    <%--                            <a href="#/san-pham/detail/{{xd.id}}">--%>
    <%--                                <img--%>
    <%--                                        src="../../assets/img-pro/{{xd.anhXe}}"--%>
    <%--                                        class="card-img-top"--%>
    <%--                                        alt="..."--%>
    <%--                                />--%>
    <%--                            </a>--%>
    <%--                            <div class="card-body">--%>
    <%--                                <a href="#/san-pham/detail/{{xd.id}}">--%>
    <%--                                    <h6 class="card-title">{{xd.tenXe}}</h6>--%>
    <%--                                </a>--%>
    <%--                                <p class="card-text card-mota">--%>
    <%--                                    <small>{{xd.moTa}}</small>--%>
    <%--                                </p>--%>
    <%--                                <p>--%>
    <%--                                    <a href="#/gio-hang">--%>
    <%--                                        <button type="button" class="btn btn-outline-success">--%>
    <%--                                            + Giỏ hàng--%>
    <%--                                        </button>--%>
    <%--                                    </a>--%>
    <%--                                    <a href="#/san-pham/mua-ngay">--%>
    <%--                                        <button type="button" class="btn btn-outline-danger">--%>
    <%--                                            + Mua ngay--%>
    <%--                                        </button>--%>
    <%--                                    </a>--%>
    <%--                                </p>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
</div>
<%--end body--%>
