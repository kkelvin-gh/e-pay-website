<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/Bootstrap/bootstrap.css">
    <link rel="stylesheet" href="CSS/Fontawesome/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
    <link rel="stylesheet" href="CSS/default.css">
    <title>Login Page</title>
</head>
<body class="d-flex align-items-center justify-content-center">

    <!-- Card Login Form -->
    <div class="card login-form-card col-3 bg-transparent border-0">

        <!-- Card Body -->
            <div class="card-body">

                <!-- Form Header -->
                <h1 class="form-header card-title mb-3" style="color: white; text-shadow: 0px 3px 6px blue;">
                    <i class="fas fa-user-circle"></i> Login
                </h1>
                <!-- End of Form Header -->

                <!-- Display Message -->
                <c:if test = "${requestScope.success != null}">
                    <div class="alert alert-success text-center border border-success">
                        <b>${requestScope.success}</b>
                    </div>
                </c:if>
                <!-- End Display Message -->

                <!-- Display Message -->
                <c:if test = "${logged_out != null}">
                    <div class="alert alert-info text-center border border-info">
                        <b>${logged_out}</b>
                    </div>
                </c:if>
                <!-- End Display Message -->

                <!-- Display Message -->
                <c:if test = "${requestScope.error != null}">
                    <div class="alert alert-danger text-center border border-danger">
                        <b>${requestScope.error}</b>
                    </div>
                </c:if>
                <!-- End Display Message -->


                <!-- Login Form -->
                <form action="/login" method="POST" class="login-form">

                    <!-- form-group -->
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="Enter your email here" />
                    </div>
                    <!-- End of form-group -->

                    <!-- form-group -->
                    <div class="form-group col">
                        <input type="password" name="password" class="form-control" placeholder="Enter your password here" />
                    </div>
                    <!-- End of form-group -->

                    <!-- form-group -->
                    <div class="form-group col">
                        <input type="hidden" name="_token" value="${token}"/>
                    </div>
                    <!-- End of form-group -->

                    <!-- form-group -->
                    <div class="form-group">
                        <button class="btn btn-md">Login</button>
                    </div>
                    <!-- End of form-group -->

                </form>
                <!-- End of Login Form-->

                <!-- Card Text -->
                <p class="card-form text-black my-2">
                    Don't have a account?<span class="ms-2" style="color :Blue; text-shadow:  0px 3px 6px blue;; "><a href="/register" class="btn btn-sm mb-1" style="border-radius: 20px;">Sign Up</a></span></span>
                </p>
                <!-- End of Card Text -->

                <!-- Back Button -->
                <small class="text-warning">
                    <i class="fa fa-arrow-alt-circle-left"></i>
                </small>

                <a href="/" class="btn btn-sm mb-1" style="font-size: medium; ;">Back</a>

                <!-- End of Back Button -->

            </div>
        <!-- End of Card Body -->

    </div>
    <!-- End of Card Login Form -->

</body>
</html>