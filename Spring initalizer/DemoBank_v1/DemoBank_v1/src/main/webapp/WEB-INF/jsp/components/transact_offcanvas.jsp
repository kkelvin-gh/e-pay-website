<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Start offcanvas Transact -->
  <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header mt-3">
      <h5 class="offcanvas-title" id="offcanvasExampleLabel">Transact</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>

    <!-- Transact Body -->
    <div class="offcanvas-body sha">

      <small class="card-text ms-4 text-white">
        Choose an option below to perform a transaction:
      </small>

      <!-- Transactions type drop down list  -->
      <select name="transact-type" class="form-control mt-1" id="transact-type">
        <option value="">-- Select Transaction Type --</option>
        <option value="payment">Payment</option>
        <option value="transfer">Transfer</option>
        <option value="deposit">Deposit</option>
        <!-- <option value="withdraw">Withdraw</option> -->
      </select>
      <!-- End of Transactions type drop down list -->

      <c:import url= "components/transact_forms/payment_form.jsp"/>
      <c:import url= "components/transact_forms/transfer_form.jsp"/>
      <c:import url= "components/transact_forms/deposit_form.jsp"/>
      <c:import url= "components/transact_forms/withdraw_form.jsp"/>

    </div>
    <!-- End of Transact Body -->
  </div>
<!-- End of Start offcanvas Transact -->