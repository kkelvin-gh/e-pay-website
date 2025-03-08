package com.demo_bank_v1.helpers;

public class HTML
{
    public static String htmlEmailTemplate(String token, String code)
    {
        String url = "http://127.0.0.1:8070/verify?token=" + token + "&code=" + code;
        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang='en'>\n" +
                "<head>\n" +
                "    <meta charset='UTF-8'>\n" +
                "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" +
                "    <title>Email Verification</title>\n" +
                "    <!-- <link rel='stylesheet' href='CSS/email.css'> -->\n" +
                "    <style>\n" +
                "        *{\n" +
                "            box-sizing: border-box;\n" +
                "            font-family: comfortaa;\n" +
                "        }\n" +
                "        \n" +
                "        /* Main body styling*/\n" +
                "        \n" +
                "        body{\n" +
                "            height: 100vh;\n" +
                "            background-color: rgb(150, 150, 197);\n" +
                "            display: flex;\n" +
                "            align-items: center;\n" +
                "            justify-content: center;\n" +
                "        }\n" +
                "        \n" +
                "        /* wrapper */\n" +
                "        \n" +
                "        .wrapper{\n" +
                "            width: 550px;\n" +
                "            height: auto;\n" +
                "            padding: 15px;\n" +
                "            background-color: white;\n" +
                "            border-radius: 7px;\n" +
                "        }\n" +
                "        \n" +
                "        \n" +
                "        /* Email msg Header */\n" +
                "        .email-msg-header{\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "        \n" +
                "        /* Company Name */\n" +
                "        .company-name{\n" +
                "            width: 100%;\n" +
                "            font-size: 35px;\n" +
                "            color: grey;\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "        \n" +
                "        .welcome-text{\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "        \n" +
                "        .verify-account-btn{\n" +
                "            padding: 15px;\n" +
                "            background-color: blue;\n" +
                "            text-decoration: none;\n" +
                "            color: white;\n" +
                "            border-radius: 5px;\n" +
                "        }\n" +
                "        \n" +
                "        .copy-right{\n" +
                "            text-align: center;\n" +
                "            color: grey;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    \n" +
                "    <!-- Wrapper -->\n" +
                "    <div class='wrapper'>\n" +
                "        <!-- Email msg header -->\n" +
                "        <h2 class='email-msg-header'>\n" +
                "            Welcome and Thank you for choosing\n" +
                "        </h2>\n" +
                "        <!-- End of Email msg header -->\n" +
                "\n" +
                "        <!-- Company Name -->\n" +
                "        <div class=\"company-name\">E-pay</div>\n" +
                "        <!-- End of Company Name -->\n" +
                "        <hr>\n" +
                "\n" +
                "        <p class=\"welcome-text\">\n" +
                "            Your account has been successfully registered, please click below to verify your account\n" +
                "        </p>\n" +
                "        <br>\n" +
                "\n" +
                "        <center><a href='"+ url +"' class=\"verify-account-btn\" role=\"button\">Verify Account</a></center>\n" +
                "        <br>\n" +
                "        <br>\n" +
                "\n" +
                "        <div class=\"copy-right\">\n" +
                "            &copy; Copy Right 2024. All Rights Reserved.\n" +
                "        </div>\n" +
                "    </div>\n" +
                "    <!-- End of Wrapper -->\n" +
                "\n" +
                "\n" +
                "</body>\n" +
                "</html>";

        return emailTemplate;
    }
}
