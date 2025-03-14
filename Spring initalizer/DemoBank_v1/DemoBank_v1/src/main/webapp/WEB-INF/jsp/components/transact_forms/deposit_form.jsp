<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Card Deposit -->
      <div class="card mt-2 deposit-card" style="display: none;">
        <!-- Card Body -->
        <div class="card-body">

          <form action="/transact/deposit" method="POST" class="deposit-form">

            <!-- Form Group -->
            <div class="form-group mb-2">
              <label for="">Enter Deposit Amount</label>
              <input type="text" name="deposit_amount" class="form-control" placeholder="Enter Deposit Amount">
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
                          <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                      </c:forEach>
                  </c:if>
              </select>
              <!-- End of Select Account Option -->

            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
              <button id="" class="btn btn-md transact-btn">Deposit</button>
            </div>
            <!-- End of Form Group -->

          </form>

        </div>
        <!-- End of Card Body -->
      </div>
<!-- End of Card Deposit -->