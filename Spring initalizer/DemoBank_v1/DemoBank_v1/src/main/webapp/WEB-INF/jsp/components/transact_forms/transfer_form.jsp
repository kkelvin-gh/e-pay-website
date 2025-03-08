<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Card Transfer -->
<div class="card mt-2 transfer-card" style="display: none;">
    <!-- Card Body -->
    <div class="card-body">

        <!-- Transfer Form -->
        <form action="/transact/transfer" method="POST">
            <!-- Form Group -->
            <div class="form-group mb-2">
                <label for="">Select Sending Account</label>

                <!-- Select Account Option -->
                <select name="transfer_from" class="form-control" id="">
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
                <label for="">Select Receiving Account</label>

                <!-- Select Account Option -->
                <select name="transfer_to" class="form-control" id="">
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
                <label for="">Enter Transfer Amount</label>
                <input type="text" name="transfer_amount" class="form-control" placeholder="Enter Payment Amount">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
                <button id="" class="btn btn-md transact-btn">Transfer</button>
            </div>
            <!-- End of Form Group -->
        </form>
        <!-- End of Transfer Form -->

    </div>
    <!-- End of Card Body -->
</div>
<!-- End of Card Transfer -->
