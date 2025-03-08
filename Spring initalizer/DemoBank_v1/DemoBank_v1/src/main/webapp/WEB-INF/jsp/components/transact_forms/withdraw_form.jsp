<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Card Withdraw -->
      <div class="card mt-2 withdrawal-card" style="display: none;">
        <!-- Card Body -->
        <div class="card-body">

          <div class="Withdraw-form">

            <!-- Form Group -->
            <div class="form-group mb-2">
              <label for="">Enter Withdrawal Amount</label>
              <input type="text" name="withdrawal_amount" class="form-control" placeholder="Enter Withdrawal Amount">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
              <label for="">Select Account</label>

              <!-- Select Account Option -->
              <select name="account_id" class="form-control" id="">
                <option value="">-- Select Account --</option>
              </select>
              <!-- End of Select Account Option -->
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
              <button id="" class="btn btn-md transact-btn">Withdraw</button>
            </div>
            <!-- End of Form Group -->

          </div>
        </div>
        <!-- End of Card Body -->
      </div>
<!-- End of Card Withdraw -->