package com.demo_bank_v1.controller;

import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.AccountRepository;
import com.demo_bank_v1.repository.PaymentRepository;
import com.demo_bank_v1.repository.TransactRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/transact")
public class TransactController
{
    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private TransactRepository transactRepository;

    User user;
    double currentBalance;
    double newBalance;
    LocalDateTime currentDateTime = LocalDateTime.now();;
    @PostMapping("/deposit")
    public String deposit(@RequestParam("deposit_amount") String depositAmount,
                          @RequestParam("account_id") String accountId,
                          HttpSession session,
                          RedirectAttributes redirectAttributes)
    {
        if(depositAmount.isEmpty() || accountId.isEmpty())
        {
            redirectAttributes.addFlashAttribute("error","Deposit Amount or Depositing account cannot be empty!");
            return "redirect:/app/dashboard";
        }

        user = (User)session.getAttribute("user");

        int acc_id = Integer.parseInt(accountId);

        double depositAmountValue = Double.parseDouble(depositAmount);
        currentBalance = accountRepository.getAccountBalance(user.getUser_id(), acc_id);

        if(depositAmountValue == 0)
        {
            redirectAttributes.addFlashAttribute("error","Deposit Amount cannot be empty!");
            return "redirect:/app/dashboard";
        }

        newBalance = currentBalance + depositAmountValue;
        accountRepository.changeAccountBalanceById(newBalance, acc_id);

        transactRepository.logTransaction(acc_id, "deposit", depositAmountValue,"online","success","Deposit Transaction successful", currentDateTime);

        redirectAttributes.addFlashAttribute("success","Amount deposited successfully");
        return "redirect:/app/dashboard";
    }

    @PostMapping("/transfer")
    public String transfer(@RequestParam("transfer_from") String transfer_from,
                           @RequestParam("transfer_to") String transfer_to,
                           @RequestParam("transfer_amount") String transfer_amount,
                           HttpSession session,
                           RedirectAttributes redirectAttributes)
    {
        if(transfer_from.isEmpty() || transfer_to.isEmpty() || transfer_amount.isEmpty())
        {
            redirectAttributes.addFlashAttribute("error","Transfer from or to the account or the Amount cannot be empty!");
            return "redirect:/app/dashboard";
        }

        int transferFromId = Integer.parseInt(transfer_from);
        int transferToId = Integer.parseInt(transfer_to);
        double transferAmount = Double.parseDouble(transfer_amount);

        if(transferFromId == transferToId)
        {
            redirectAttributes.addFlashAttribute("error","Cannot be transferred into the same account, choose different accounts while transferring");
            return "redirect:/app/dashboard";
        }

        if(transferAmount == 0)
        {
            redirectAttributes.addFlashAttribute("error","Transferring amount cannot be 0(Zero)");
            return "redirect:/app/dashboard";
        }

        user = (User)session.getAttribute("user");

        double currentBalanceOfAccountTransferringFrom = accountRepository.getAccountBalance(user.getUser_id(), transferFromId);

        double currentBalanceOfAccountTransferringTo = accountRepository.getAccountBalance(user.getUser_id(), transferToId);


        double newBalanceOfAccountTransferringFrom = currentBalanceOfAccountTransferringFrom - transferAmount;

        double newBalanceOfAccountTransferringTo = currentBalanceOfAccountTransferringTo + transferAmount;

        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringFrom, transferFromId);

        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringTo, transferToId);

        transactRepository.logTransaction(transferFromId, "transfer", transferAmount, "online", "success", "Transfer is done successfully", currentDateTime);

        redirectAttributes.addFlashAttribute("success","Amount Transferred Successfully!");
        return "redirect:/app/dashboard";
    }

    @PostMapping("/payment")
    public String payment(@RequestParam("account_name") String account_name,
                          @RequestParam("account_number") String account_number,
                          @RequestParam("account_id") String account_id,
                          @RequestParam("reference") String reference,
                          @RequestParam("payment_amount") String payment_amount,
                          HttpSession session,
                          RedirectAttributes redirectAttributes)
    {
        if(account_name.isEmpty() || account_number.isEmpty() || account_id.isEmpty() || payment_amount.isEmpty())
        {
            String errorMsg = "Account name/Account number/Account paying from/Transfer Amount Cannot be empty!";
            redirectAttributes.addFlashAttribute("error",errorMsg);
            return "redirect:/app/dashboard";
        }

        int accountID = Integer.parseInt(account_id);
        double paymentAmount = Double.parseDouble(payment_amount);

        if(paymentAmount == 0)
        {
            redirectAttributes.addFlashAttribute("error","Payment amount cannot be 0(Zero)");
            return "redirect:/app/dashboard";
        }

        user = (User)session.getAttribute("user");

        currentBalance = accountRepository.getAccountBalance(user.getUser_id(), accountID);

        if(currentBalance < paymentAmount)
        {
            transactRepository.logTransaction(accountID, "Payment", paymentAmount, "online", "failed", "Insufficient balance", currentDateTime);

            redirectAttributes.addFlashAttribute("error","Your account balance is not Sufficient for payment");
            return "redirect:/app/dashboard";
        }

        newBalance = currentBalance - paymentAmount;

        String reasonCode = "Payment done successfully!";

        paymentRepository.makePayment(accountID, account_name, account_number, paymentAmount, reference, "success", reasonCode, currentDateTime);


        accountRepository.changeAccountBalanceById(newBalance, accountID);

        transactRepository.logTransaction(accountID, "Payment", paymentAmount, "online", "success", "Payment is done successfully", currentDateTime);


        String successMsg = reasonCode;
        redirectAttributes.addFlashAttribute("success",successMsg);
        return "redirect:/app/dashboard";
    }
}
