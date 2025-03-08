<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Right Side offcanvas Accounts form -->
  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header mt-3">
      <h5 id="offcanvasRightLabel"><br>Create / Add an Account</h5>
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>

    <div class="offcanvas-body">
      <!-- Accounts Form -->
      <div class="card">
        <!-- Card Body -->
        <div class="card-body">
          <form action="/account/create_account" method="POST" class="add-account-form">

            <!-- Form Group -->
            <div class="form-group mb-2">
              <label for="">Enter Account Name: </label>
              <input type="text" name="account_name" class="form-control" placeholder="Enter Account Name">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-2">
              <label for="">Choose Account Type:</label>
              <select name="account_type" class="form-control" id="">
                <option value="">-- Select Account Type --</option>
                <option value="current">Current</option>
                <option value="savings">Savings</option>
              </select>
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group my-2">
              <button id="" class="btn btn-md transact-btn">Add Account</button>
            </div>
            <!-- End of Form Group -->

          </form>
        </div>
        <!-- End of Card Body -->
      </div>
      <!-- End of Accounts Form -->
    </div>
  </div>
<!-- End of Right Side offcanvas Accounts form -->