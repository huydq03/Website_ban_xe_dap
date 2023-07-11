<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="bi-pencil-square" viewBox="0 0 16 16">
        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
    </symbol>
    <symbol id="bi-x-octagon-fill" viewBox="0 0 16 16">
        <path d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zm-6.106 4.5L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"/>
    </symbol>
    <symbol id="bi-plus-circle" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
    </symbol>
</svg>

<section id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">Quản lý sản phẩm</h1>
                <div class="add">
                    <a href="${pageContext.request.contextPath}/admin/product/create" class="btn btn-success">
                        <svg class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#bi-plus-circle"/>
                        </svg>
                        Thêm mới</a>
                </div>
                <br>
                <div class="data">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Mã xe</th>
                            <th scope="col">Tên xe</th>
                            <th scope="col">Danh mục</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Giá nhập</th>
                            <th scope="col">Giá bán</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Mô tả</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${f:length(ds) == 0}"><span>Không có dữ liệu</span></c:if>
                        <c:if test="${f:length(ds) != 0}">
                            <c:forEach items="${ds}" var="ctsp" varStatus="i">
                                <tr>
                                    <td>${i.index+1}</td>
                                    <td>${ctsp.code}</td>
                                    <td>${ctsp.name}
                                    </td>
                                    <td>${ctsp.category.name}
                                    </td>
                                    <td>${ctsp.quantity}
                                    </td>
                                    <td>${ctsp.priceImport}</td>
                                    <td>${ctsp.priceSale}</td>
                                    <td>
                                        <c:if test="${ctsp.avaliable ==1}">Đang bán</c:if>
                                        <c:if test="${ctsp.avaliable ==0}">Hết hàng</c:if>
                                    </td>
                                    <td>${ctsp.image}</td>
                                    <td>${ctsp.descriptions}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/product/edit/${ctsp.id}" class="btn btn-primary">
                                            <svg class="bi pe-none me-2" width="16" height="16">
                                                <use xlink:href="#bi-pencil-square"/>
                                            </svg>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/product/delete/${ctsp.id}" class="btn btn-danger">
                                            <svg class="bi pe-none me-2" width="16" height="16">
                                                <use xlink:href="#bi-x-octagon-fill"/>
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${pageNum==1?'disabled':''}"><a class="page-link"
                                                                             href="${pageContext.request.contextPath}/admin/product/list?pageNum=${pageNum == 1 ? 1 : pageNum-1}">Pre</a>
                        </li>
                        <c:forEach begin="1" end="${totalPage}" varStatus="status">
                            <li class="page-item">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/admin/product/list?pageNum=${status.index}">${status.index}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${pageNum==totalPage?'disabled':''}"><a class="page-link"
                                                                                     href="${pageContext.request.contextPath}/admin/product/list?pageNum=${pageNum == totalPage ? totalPage : pageNum+1}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
</section>

