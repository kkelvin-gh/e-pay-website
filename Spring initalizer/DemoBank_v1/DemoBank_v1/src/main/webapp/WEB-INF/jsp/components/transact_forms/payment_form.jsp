<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Payment Card -->
<div class="card mt-2 payment-card" style="display: none;">
    <!-- Card Body -->
    <div class="card-body">

        <!-- Payment Form -->
        <form action="/transact/payment" method="POST">
            <!-- Form Group -->
            <div class="form-group mb-2">
                <label for="">Account Holder Name</label>
                <input type="text" name="account_name" class="form-control" placeholder="Enter the Account Holder Name">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
                <label for="">Account Holder Number</label>
                <input type="text" name="account_number" class="form-control" placeholder="Enter the Account Holder No.">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
                <label for="">Select Receiving Account</label>

                <!-- Select Account Option -->
                <select name="account_id" class="form-control" id="">
                    <option value="">-- Select Account --</option>
                    <c:if test="${userAccounts != null}">
                        <c:forEach items="${userAccounts}" var="selectAccount">
                            <option value="${selectAccount.account_id}">
                                ${selectAccount.account_name}
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
                <!-- End of Select Account Option -->
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
                <label for="">Reference</label>
                <input type="text" name="reference" class="form-control" placeholder="Enter Reference">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
                <label for="">Enter Payment Amount</label>
                <input type="text" name="payment_amount" class="form-control" placeholder="Enter Transfer Amount">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
                <button id="" class="btn btn-md transact-btn">Pay</button>
            </div>
            <!-- End of Form Group -->
        </form>
        <!-- End of Payment Form -->
    </div>
    <!-- End of Card Body -->
</div>
<!-- End of Card payment -->
