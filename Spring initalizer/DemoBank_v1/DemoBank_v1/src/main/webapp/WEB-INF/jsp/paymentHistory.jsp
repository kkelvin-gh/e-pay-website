<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../CSS/Bootstrap/bootstrap.css">
  <!-- <link rel="stylesheet" href="CSS/Fontawesome/all.css"> -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <link rel="stylesheet" href="../CSS/main.css">
  <script src="../JS/bootstrap.bundle.js"></script>
  <title>Dashboard</title>
</head>

<body>
    <c:import url= "components/incl/header.jsp"/>

    <!-- Container -->
    <div class="container">
        <!-- Card -->
        <div class="card">

            <!-- Card Header -->
            <div class="card-header">
                <i class="fas fa-credit-card me-2" aria_hidden="true"></i> Payment History
            </div>
            <!-- End of Card Header -->

            <!-- Card body -->
            <div class="card-body">
                <c:if test="${requestScope.payment_history != null}">
                    <!-- Payment History Table -->
                        <table class="table text-center table-striped">

                            <tr>
                                <th>Record Number</th>
                                <th>Beneficiary</th>
                                <th>Beneficiary Account Number</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Reference</th>
                                <th>Reason Code</th>
                                <th>Created at</th>
                            </tr>

                            <!-- Loop Through Payment History Records -->

                            <c:forEach items="${requestScope.payment_history}" var="payments">

                            <tr>
                                <td>${payments.payment_id}</td>
                                <td>${payments.beneficiary}</td>
                                <td>${payments.beneficiary_acc_no}</td>
                                <td>${payments.amount}</td>
                                <td>${payments.status}</td>
                                <td>${payments.reference_no}</td>
                                <td>${payments.reason_code}</td>
                                <td>${payments.created_at}</td>
                            </tr>

                            </c:forEach>
                            <!-- End of Loop Through Payment History Records -->
                        </table>
                    <!-- End of Payment History Table -->
                </c:if>
            </div>
            <!-- End of Card body -->
        </div>
        <!-- End of Card -->
    </div>
    <!-- End of Container -->


    <c:import url= "components/incl/footer.jsp"/>