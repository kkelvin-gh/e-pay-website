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

    <!-- Transact offcanvas: pulls from the left -->
    <c:import url= "components/transact_offcanvas.jsp"/>

    <!-- Add accounts offcanvas: pulls from the right -->
    <c:import url= "components/add_accounts_offcanvas.jsp"/>
                <!-- Display Message -->
                <c:if test = "${success != null}">
                    <div class="alert alert-success text-center border border-success">
                        <b>${success}</b>
                    </div>
                </c:if>
                <!-- End Display Message -->

                <!-- Display Message -->
                <c:if test = "${error != null}">
                    <div class="alert alert-danger text-center border border-danger">
                         <b>${error}</b>
                    </div>
                </c:if>
                <!-- End Display Message -->
    <c:choose>
        <c:when test="${fn:length(userAccounts) > 0}">
            <c:import url="components/accounts_display.jsp"/>
        </c:when>
        <c:otherwise>
            <c:import url="components/no_accounts_display.jsp"/>
        </c:otherwise>
    </c:choose>

    <c:import url= "components/incl/footer.jsp"/>