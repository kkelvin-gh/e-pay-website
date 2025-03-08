<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Container: No of Accounts -->
  <div class="container mt-2">
    <div class="card no-accounts-card">
      <!-- Card Body -->
      <div class="card-body">
        <h1 class="card-title">
          <i class="fas fa-ban text-danger"></i> Not Registered Accounts
        </h1>
        <hr>
        <div class="card-text mb-2">
          You currently do have any registered accounts. <br>
          Please click below to Register / add a new Account
        </div>

        <button id="add-acc-btn" style="background-color: #57abdb; color: black;" class="btn shadow mt-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"aria-controls="offcanvasRight">
          <i class="fas fa-credit-card me-2" aria-hidden="true"></i>Add New Account
        </button>
      </div>
      <!-- End of Card Body -->
    </div>
  </div>
<!-- End of Container: No of Accounts -->