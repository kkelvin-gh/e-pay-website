<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Main Page Header -->
  <header class="main-page-header mb-3 bg-primary ">

    <!-- Container -->
    <div class="container d-flex align-items-center">

      <!-- Company Name -->
      <div class="company-name">
        E-pay
      </div>
      <!-- End of Company Name -->

      <!-- Navigation -->
      <nav class="navigation">
        <li><a href="/app/dashboard">Dashboard</a></li>
        <li><a href="/app/payment_history">Payment History</a></li>
        <li><a href="/app/transaction_history">Transaction History</a></li>
      </nav>
      <!-- End of Navigation -->

      <!-- Display Name -->
      <div class="display-name ms-auto text-white">
        <i class="fas fa-user-circle text-success me-1"></i> Welcome, <span>${user.first_name} ${user.last_name}</span>
      </div>
      <!-- End of Display Name -->

      <!-- Logout Button -->
      <a href="/logout" class="btn btn-sm text-white ms-3">
        <i class="fas fa-sign-out-alt"></i> Sign Out
      </a>
      <!-- End of Logout Button -->
    </div>
    <!-- End of Container -->
  </header>
<!-- End of Main Page Header -->