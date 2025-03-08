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
    <title>Register Page</title>
</head>
<body class="d-flex align-items-center justify-content-center">

    <!-- Card Registration Form -->
    <div class="card registration-form-card col-6 bg-transparent border-0">

        <!-- Card Body -->
            <div class="card-body">

                <!-- Form Header -->
                <h1 class="form-header card-title mb-3">
                    <i class="fas fa-edit"></i>Register
                </h1>
                <!-- End of Form Header -->

                <!-- Display Message -->
                <c:if test = "${requestScope.passwordMismatch != null}">
                    <div class="alert alert-danger text-center border border-danger">
                        <b>${requestScope.passwordMismatch}</b>
                    </div>
                </c:if>
                <!-- End Display Message -->

                <!-- Display Message -->
                    <c:if test = "${requestScope.success != null}">
                        <div class="alert alert-success text-center border border-success">
                            <b>${requestScope.success}</b>
                        </div>
                    </c:if>
                <!-- End Display Message -->

                <!-- Registration Form -->
                <form:form action="/register" class="reg-form" modelAttribute="registerUser">
                    <!-- Row -->
                    <div class="row">

                        <!-- form-group -->
                        <div class="form-group col">
                            <form:input type="text" path="first_name" class="form-control" placeholder="Enter your first name here"/>
                            <form:errors path="first_name" class="text-white bg-danger"/>
                        </div>
                        <!-- End of form-group -->

                        <!-- form-group -->
                        <div class="form-group col">
                            <form:input type="text" path="last_name" class="form-control" placeholder="Enter your last name here"/>
                            <form:errors path="last_name" class="text-white bg-danger"/>
                        </div>
                        <!-- End of form-group -->

                        <!-- form-group -->
                        <div class="form-group">
                            <form:input type="email" path="email" class="form-control" placeholder="Enter your email here"/>
                            <form:errors path="email" class="text-white bg-danger"/>
                        </div>
                        <!-- End of form-group -->

                        <!-- form-group -->
                        <div class="form-group col">
                            <form:input type="password" path="password" class="form-control" placeholder="Enter your password here"/>
                            <form:errors path="password" class="text-white bg-danger"/>
                        </div>
                        <!-- End of form-group -->

                        <!-- form-group -->
                        <div class="form-group col">
                            <input type="password" name="confirm_password" class="form-control" placeholder="Confirm your password"/>
                            <small class="text-white bg-danger">${confirm_pass}</small>
                        </div>
                        <!-- End of form-group -->

                        <!-- form-group -->
                        <div class="form-group">
                            <button class="btn btn-md">Register</button>
                        </div>
                        <!-- End of form-group -->
                    </div>
                    <!-- End of Row -->
                </form:form>
                <!-- End of Registration Form-->

                <!-- Card Text -->
                <p class="card-form text-black my-2">
                    Already have a account?<span class="ms-2" style="color :Blue; text-shadow:  0px 3px 6px blue;; "><a href="/login" class="btn btn-sm mb-1" style="border-radius: 20px;">Sign in</a></span>
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
    <!-- End of Card Registration Form -->

</body>
</html>