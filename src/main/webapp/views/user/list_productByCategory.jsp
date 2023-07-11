<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<section>
    <div class="container" style="margin-top: 0px;margin-bottom: 0px;">
        <%--    header--%>

        <%--    end header--%>
        <div class="bg-white rounded d-flex align-items-center justify-content-between" id="header">
            <button class="btn btn-hide text-uppercase" type="button" data-toggle="collapse" data-target="#filterbar"
                    aria-expanded="false" aria-controls="filterbar" id="filter-btn" onclick="changeBtnTxt()"
                    style=" margin-right: 15px;"><span
                    class="fas fa-angle-left" id="filter-angle"></span> <span id="btn-txt">Hide filters</span></button>
            <nav class="navbar navbar-expand-lg navbar-light pl-lg-0 pl-auto">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynav"
                        aria-controls="mynav" aria-expanded="false" aria-label="Toggle navigation"
                        onclick="chnageIcon()"
                        id="icon"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="mynav">
                    <ul class="navbar-nav d-lg-flex align-items-lg-center">
                        <li class="nav-item active"><select name="sort" id="sort">
                            <option value="" hidden selected>Sort by</option>
                            <option value="price">Price</option>
                            <option value="popularity">Popularity</option>
                            <option value="rating">Rating</option>
                        </select></li>
                        <li class="nav-item d-inline-flex align-items-center justify-content-between mb-lg-0 mb-3">
                            <%--                        <div class="d-inline-flex align-items-center mx-lg-2" id="select2">--%>
                            <%--                            <div class="pl-2">Products:</div>--%>
                            <%--                            <select name="pro" id="pro">--%>
                            <%--                                <option value="18">18</option>--%>
                            <%--                                <option value="19">19</option>--%>
                            <%--                                <option value="20">20</option>--%>
                            <%--                            </select></div>--%>
                            <%--                        <div class="font-weight-bold mx-2 result">18 from 200</div>--%>
                        </li>
                        <li class="nav-item d-lg-none d-inline-flex"></li>
                    </ul>
                </div>
            </nav>
            <div class="ml-auto mt-3 mr-2">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <%--                    <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true"--%>
                        <%--                                                                                                     class="font-weight-bold">&lt;</span>--%>
                        <%--                        <span class="sr-only">Previous</span> </a></li>--%>
                        <%--                    <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
                        <%--                    <li class="page-item"><a class="page-link" href="#">..</a></li>--%>
                        <%--                    <li class="page-item"><a class="page-link" href="#">24</a></li>--%>
                        <%--                    <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true"--%>
                        <%--                                                                                                 class="font-weight-bold">&gt;</span>--%>
                        <%--                        <span class="sr-only">Next</span> </a></li>--%>
                    </ul>
                </nav>
            </div>
        </div>
        <div id="content" class="my-5" style="margin-top: 12px !important;">
            <div id="filterbar" class="collapse">
                <div class="box border-bottom">
                    <div class="form-group text-center">
                        <div class="btn-group" data-toggle="buttons"><label class="btn btn-success form-check-label">
                            <input
                                    class="form-check-input" type="radio"> Reset </label> <label
                                class="btn btn-success form-check-label active"> <input class="form-check-input"
                                                                                        type="radio" checked> Apply
                        </label>
                        </div>
                    </div>
                    <%--                <div><label class="tick">New <input type="checkbox" checked="checked"> <span class="check"></span>--%>
                    <%--                </label></div>--%>
                    <%--                <div><label class="tick">Sale <input type="checkbox"> <span class="check"></span> </label></div>--%>
                </div>
                <div class="box border-bottom">
                    <div class="box-label text-uppercase d-flex align-items-center">Category
                        <button class="btn ml-auto" type="button" data-toggle="collapse" data-target="#inner-box"
                                aria-expanded="false" aria-controls="inner-box" id="out" onclick="outerFilter()"><span
                                class="fas fa-plus"></span></button>
                    </div>
                    <div id="inner-box" class="collapse mt-2 mr-1">
                        <c:forEach items="${list}" var="dm">
                            <a href="${pageContext.request.contextPath}/category/${dm.id}">
                                <div class="my-1">
                                    <label class="tick">
                                            ${dm.name}
                                            <%--                                        <input type="checkbox"> <span class="check"></span>--%>
                                    </label>
                                </div>
                            </a>

                        </c:forEach>

                    </div>
                </div>
<%--                <div class="box border-bottom">--%>
<%--                    <div class="box-label text-uppercase d-flex align-items-center">season--%>
<%--                        <button class="btn ml-auto collapsed" type="button" data-toggle="collapse"--%>
<%--                                data-target="#inner-box2"--%>
<%--                                aria-expanded="false" aria-controls="inner-box2"><span class="fas fa-plus"></span>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                    <div id="inner-box2" class="collapse mt-2 mr-1">--%>
<%--                        <div class="my-1"><label>Spring <input type="checkbox" checked="checked"> <span--%>
<%--                                class="check"></span> </label></div>--%>
<%--                        <div class="my-1"><label class="tick">Summer <input type="checkbox"> <span class="check"></span>--%>
<%--                        </label></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="box border-bottom">
                    <div class="box-label text-uppercase d-flex align-items-center">price
                        <button class="btn ml-auto" type="button" data-toggle="collapse" data-target="#price"
                                aria-expanded="false" aria-controls="price"><span class="fas fa-plus"></span></button>
                    </div>
                    <div class="collapse" id="price">
                        <div class="middle">
                            <div class="multi-range-slider"><input type="range" id="input-left" min="0" max="100"
                                                                   value="10"> <input type="range" id="input-right"
                                                                                      min="0"
                                                                                      max="100" value="50">
                                <div class="slider">
                                    <div class="track"></div>
                                    <div class="range"></div>
                                    <div class="thumb left"></div>
                                    <div class="thumb right"></div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mt-2">
                            <div><span id="amount-left" class="font-weight-bold"></span> uah</div>
                            <div><span id="amount-right" class="font-weight-bold"></span> uah</div>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="box-label text-uppercase d-flex align-items-center">size
                        <button class="btn ml-auto" type="button" data-toggle="collapse" data-target="#size"
                                aria-expanded="false" aria-controls="size"><span class="fas fa-plus"></span></button>
                    </div>
                    <div id="size" class="collapse">
                        <div class="btn-group d-flex align-items-center flex-wrap" data-toggle="buttons"><label
                                class="btn btn-success form-check-label"> <input class="form-check-input"
                                                                                 type="checkbox">
                            80 </label> <label class="btn btn-success form-check-label"> <input class="form-check-input"
                                                                                                type="checkbox" checked>
                            92
                        </label> <label class="btn btn-success form-check-label"> <input class="form-check-input"
                                                                                         type="checkbox" checked> 102
                        </label> <label class="btn btn-success form-check-label"> <input class="form-check-input"
                                                                                         type="checkbox" checked> 104
                        </label> <label class="btn btn-success form-check-label"> <input class="form-check-input"
                                                                                         type="checkbox" checked> 106
                        </label> <label class="btn btn-success form-check-label"> <input class="form-check-input"
                                                                                         type="checkbox" checked> 108
                        </label></div>
                    </div>
                </div>
            </div>

            <div id="products">
                <div class="row mx-0">
                    <c:forEach items="${listPro}" var="sp">
                        <div class="col-lg-4 col-md-6">
                            <div class="card d-flex flex-column align-items-center">
                                <a href="${pageContext.request.contextPath}/product/detail/${sp.id}">
                                    <div class="product-name">${sp.name}</div>
                                    <div class="card-img"><img
                                            src="${pageContext.request.contextPath}/upload/${sp.image}"
                                            alt=""></div>
                                    <div class="card-body pt-5">
                                        <div class="text-muted text-center mt-auto">Số lượng: ${sp.quantity}</div>
                                            <%--                            <div class="d-flex align-items-center justify-content-center colors my-2">--%>
                                            <%--                                <div class="btn-group" data-toggle="buttons" data-tooltip="tooltip"--%>
                                            <%--                                     data-placement="right" title="choose color"><label--%>
                                            <%--                                        class="btn btn-red form-check-label"> <input class="form-check-input"--%>
                                            <%--                                                                                     type="radio" autocomplete="off">--%>
                                            <%--                                </label> <label class="btn btn-blue form-check-label active"> <input--%>
                                            <%--                                        class="form-check-input" type="radio" autocomplete="off"> </label> <label--%>
                                            <%--                                        class="btn btn-green form-check-label"> <input class="form-check-input"--%>
                                            <%--                                                                                       type="radio" autocomplete="off">--%>
                                            <%--                                </label> <label class="btn btn-orange form-check-label"> <input class="form-check-input"--%>
                                            <%--                                                                                                type="radio"--%>
                                            <%--                                                                                                autocomplete="off">--%>
                                            <%--                                </label> <label class="btn btn-pink form-check-label"> <input class="form-check-input"--%>
                                            <%--                                                                                              type="radio"--%>
                                            <%--                                                                                              autocomplete="off">--%>
                                            <%--                                </label></div>--%>
                                            <%--                            </div>--%>
                                        <div class="d-flex align-items-center price" style="margin-left: 80px">$:
                                            <div class="del mr-2"><span class="text-dark"> ${sp.priceSale}</span></div>
                                            <div class="font-weight-bold"> ${sp.priceImport}</div>
                                        </div>
                                    </div>
                                </a>
                                <div>
                                    <p>
                                        <a href="${pageContext.request.contextPath}/product/cart">
                                            <button type="button" class="btn btn-outline-success">
                                                + Giỏ hàng
                                            </button>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/product/buy-now">
                                            <button type="button" class="btn btn-outline-danger">
                                                + Mua ngay
                                            </button>
                                        </a>
                                    </p>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${pageNum==1?'disabled':''}"><a class="page-link"
                                                                                 href="${pageContext.request.contextPath}/category/${id}?pageNum=${pageNum == 1 ? 1 : pageNum-1}">Pre</a>
                            </li>
                            <c:forEach begin="1" end="${totalPage}" varStatus="status">
                                <li class="page-item">
                                    <a class="page-link"
                                       href="${pageContext.request.contextPath}/category/${id}?pageNum=${status.index}">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${pageNum==totalPage?'disabled':''}"><a class="page-link"
                                                                                         href="${pageContext.request.contextPath}/category/${id}?pageNum=${pageNum == totalPage ? totalPage : pageNum+1}">Next</a>
                            </li>
                        </ul>
                    </nav>

                </div>

            </div>

        </div>
    </div>

</section>
