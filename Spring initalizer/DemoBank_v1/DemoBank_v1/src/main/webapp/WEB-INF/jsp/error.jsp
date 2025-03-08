<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/Bootstrap/bootstrap.css">
    <link rel="stylesheet" href="CSS/Fontawesome/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
    <link rel="stylesheet" href="CSS/default.css">
    <title>Error Page</title>
</head>
<body class="d-flex align-items-center justify-content-center">
    <!-- Error Card -->
    <div class="card col-4 alert alert-danger border border-danger col-4" style="box-shadow: 0px 3px 6px red;">
        <!-- Card Title -->
            <div class="card-title">
                <i class="fa fa-window-close me-1"></i> Error:
            </div>
        <!-- End of Card Title -->
        <hr>
        <!-- Card Body -->
            <div class="card-body">
                <p class="card-text">
                    <!-- Display Message -->
                    <c:if test = "${requestScope.error != null}">
                        <div class="alert alert-danger text-center border border-danger">
                            <b>${requestScope.error}</b>
                        </div>
                    </c:if>
                    <!-- End Display Message -->
                </p>
                <hr>
                <a href="/login" class="btn btn-sm btn-danger">
                    <i class="fa fa-arrow-alt-circle-left me-1"></i> Back
                </a>
            </div>
        <!-- End of Card Body -->
    </div>
    <!-- End of Error Card -->
</body>
</html>