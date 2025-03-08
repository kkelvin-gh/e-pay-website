<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Container -->
<div class="container d-flex" style="justify-content: space-between; align-items: center;">
    <button id="add-acc-btn" class="btn shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
      <i class="fas fa-credit-card me-2" aria-hidden="true"></i>Add New Account
    </button>

    <button id="transact-btn" class="btn btn-lg ms-auto shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
      <i class="fas fa-wallet me-2"></i>Transact
    </button>
</div>

<!-- Balance Display -->
<div class="container d-flex py-2" style="justify-content: space-between; align-items: center;">
    <h2 class="me-auto">Total Account's Balance: </h2>
    <h2 class="ms-auto">
        <c:if test="${requestScope.totalBalance != null}">
            <c:out value="${totalBalance}"/>
        </c:if>
    </h2>
</div>

<!-- Accordion container -->
<div class="container mt-3">
    <c:if test="${requestScope.userAccounts != null}">
        <c:forEach items="${requestScope.userAccounts}" var="account">
            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${account.account_id}" aria-expanded="false" aria-controls="flush-collapseOne">
                            ${account.account_name}
                        </button>
                    </h2>
                    <div id="flush-${account.account_id}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <!-- Account Details List -->
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex">Account Name <span class="ms-auto"><b>${account.account_name}</b></span></li>
                                <li class="list-group-item d-flex">Account Number <span class="ms-auto"><b>${account.account_number}</b></span></li>
                                <li class="list-group-item d-flex">Account Type <span class="ms-auto"><b>${account.account_type}</b></span></li>
                                <li class="list-group-item d-flex">Account Balance <span class="ms-auto"><b>${account.balance}</b></span></li>
                                <li class="list-group-item d-flex">Created at <span class="ms-auto"><b>${account.created_at}</b></span></li>
                            </ul>
                            <!-- Account Details List -->
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
<!-- End of Accordion container -->


