<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<section>
    <div class="wrapper">

        <!-- Page Content  -->
        <div id="content">
            <nav th:replace="index :: topBar"></nav>
            <div class="line"></div>
            <div class="container" id="app">

                <div class="row g-2">
                    <div class="col-md-3" th:replace="index :: generalSection"></div>

                    <div class="col-md-9">
                        <div class="card" style="height: auto">
                            <div class="card-header">

                                <div class="tab">
                                    <button class="tablinks" onclick="openTab(event, 'cart')"
                                            id="defaultOpen">
                                        <i class="fas fa-cart-plus" title="View Cart"
                                           style="color: #5629c0; font-size: 20px"></i>
                                    </button>
                                    <h4>SHOPPING CART [<small> ${totalItem} Item(s)</small>]</h4>


                                </div>
                            </div>
                            <div class="card-body">

                                <div id="cart" class="tabcontent">
                                    <div class="col-12">
                                        <div class="row">

                                            <div class=" table-responsive shopping-cart"
                                                 style="background-color: #fff">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th>Image</th>
                                                        <th>Product</th>
                                                        <th class="text-center">Quantity</th>
                                                        <th class="text-center">Price</th>
                                                        <th class="text-center">Subtotal</th>

                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    <%--                                       test--%>
                                                    <c:forEach items="${shoppingCart.cartItems}" var="item" varStatus="i">
                                                        <tr>
                                                            <td class="text-center text-sm text-medium">
                                                                 ${i.index+1}
                                                            </td>
                                                            <td>
                                                                <div class="product-item">
                                                                    <a class="product-thumb" href="#"><img
                                                                            src="${pageContext.request.contextPath}/upload/${item.product.image}"
                                                                            alt="Product" height="80px" width="100px"></a>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="product-item">
                                                                    <div class="product-info">
                                                                        <h6 class="product-title">
                                                                            <a href="#">${item.product.name}</a>
                                                                        </h6>

                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="text-center">
                                                                <form action="${pageContext.request.contextPath}/cart/update/${item.product.id}" method="post">
                                                                    <input type="hidden" value="cartItem.id"
                                                                           name="item_id"/>
                                                                    <div class="input-group">
                                                                        <input type="number" name="quantities"
                                                                               value="${item.quantity}"
                                                                               attr="max=cartItem.product.quantity"
                                                                               class="form-control round-input form-control-sm"
                                                                                min="1"
                                                                        />
                                                                        <button class="btn btn-success btn-sm btn-custom"
                                                                                type="submit">
                                                                            <i class="fa fa-check"></i>
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </td>
                                                            <td class="text-center text-lg text-medium" style="width: 80px;">
                                                                $ ${item.product.priceSale}
                                                            </td>
                                                            <td class="text-center text-sm text-medium">
                                                                $ ${item.unitPrice * item.quantity}
                                                            </td>
                                                            <td class="text-center"><a class="remove-from-cart btn btn-danger"
                                                                                       href="${pageContext.request.contextPath}/cart/remove/${item.product.id}"
                                                                                       data-toggle="tooltip"><i
                                                                    class="fa fa-trash "></i></a></td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="shopping-cart-footer">
                                                <div class="column">

                                                </div>
                                                <div class="column text-lg">
                                                    <b>Grand Total: <span
                                                            class="text-medium">$${shoppingCart.totalPrice}</span></b>
                                                </div>
                                            </div>
                                            <div class="shopping-cart-footer">

                                                <div class="column cart-button">

                                                    <a class="btn checkout btn-success" href="#">Checkout</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="line"></div>
            </div>
        </div>
    </div>

</section>
