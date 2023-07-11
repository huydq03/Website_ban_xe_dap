<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
<%--body--%>
<!--  -->
<div class="container trang-chu">

    <div class="san-pham-ban-chay">
        <h5 class="title-detail">Chi tiết sản phẩm</h5>
        <div
                class="row g-0 bg-body-secondary position-relative"
        >
            <div class="col-md-6 mb-md-0 p-md-4">
                <img src="${pageContext.request.contextPath}/upload/${product.image}" class="w-100" alt="..." />
            </div>
            <div class="col-md-6 p-4 ps-md-0">
                <h5 class="mt-0">${product.name}</h5>

                <div
                >
                    <p>Danh mục: ${product.category.name}</p>
                </div>
                <p>Giá tiền: ${product.priceSale}</p>
                <p>Giảm giá: ${product.priceSale - product.priceImport}</p>
                <p>Thành tiền: ${product.priceImport}</p>
                <p>Số lượng: ${product.quantity}</p>
                <p>Mô tả: ${product.descriptions}</p>
                <p>
                    <a href="${pageContext.request.contextPath}/cart/buy/${product.id}">
                        <button type="button" class="btn btn-outline-success">
                            + Giỏ hàng
                        </button>
                    </a>
<%--                    <a href="#/san-pham/mua-ngay">--%>
<%--                        <button type="button" class="btn btn-outline-danger">--%>
<%--                            + Mua ngay--%>
<%--                        </button>--%>
<%--                    </a>--%>
                </p>
            </div>
        </div>
        <div class="sanphamTuongTu">
            <h6 class="title-tuongtu"><span>Sản phẩm tương tự</span></h6>
            <div class="row">
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
                                        <div class="del mr-2"><span class="text-dark"> ${sp.priceSale*1.5}</span></div>
                                        <div class="font-weight-bold"> ${sp.priceSale}</div>
                                    </div>
                                </div>
                            </a>
                            <div>
                                <p>
                                    <a href="${pageContext.request.contextPath}/cart/buy/${sp.id}">
                                        <button type="button" class="btn btn-outline-success">
                                            + Giỏ hàng
                                        </button>
                                    </a>
<%--                                    <a href="${pageContext.request.contextPath}/product/buy-now">--%>
<%--                                        <button type="button" class="btn btn-outline-danger">--%>
<%--                                            + Mua ngay--%>
<%--                                        </button>--%>
<%--                                    </a>--%>
                                </p>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>

    </div>

</div>
<%--end body--%>
</section>
