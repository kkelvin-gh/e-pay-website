package com.demo_bank_v1.controller;

import com.demo_bank_v1.models.Account;
import com.demo_bank_v1.models.PaymentHistory;
import com.demo_bank_v1.models.TransactionHistory;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.AccountRepository;
import com.demo_bank_v1.repository.PaymentHistoryRepository;
import com.demo_bank_v1.repository.TransactionHistoryRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController
{
    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PaymentHistoryRepository paymentHistoryRepository;

    @Autowired
    private TransactionHistoryRepository transactionHistoryRepository;

    User user;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session)
    {
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        user = (User)session.getAttribute("user");

        List<Account> getUserAccount = accountRepository.getUserAccountById(user.getUser_id());

        BigDecimal totalAccountsBalance = accountRepository.getTotalBalance(user.getUser_id());

        getDashboardPage.addObject("userAccounts",getUserAccount);
        getDashboardPage.addObject("totalBalance", totalAccountsBalance);

        return getDashboardPage;
    }

    @GetMapping("/payment_history")
    public ModelAndView getPaymentHistory(HttpSession session)
    {
        ModelAndView getPaymentHistoryPage = new ModelAndView("paymentHistory");
        user = (User)session.getAttribute("user");

        List<PaymentHistory> userPaymentHistory = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());

        getPaymentHistoryPage.addObject("payment_history", userPaymentHistory);

        return getPaymentHistoryPage;
    }

    @GetMapping("/transaction_history")
    public ModelAndView getTransactionHistory(HttpSession session)
    {
        ModelAndView getTransactionHistoryPage = new ModelAndView("transactHistory");
        user = (User)session.getAttribute("user");

        List<TransactionHistory> userTransactHistory = transactionHistoryRepository.getTransactionRecordsById(user.getUser_id());

        getTransactionHistoryPage.addObject("transaction_history", userTransactHistory);

        return getTransactionHistoryPage;
    }
}
