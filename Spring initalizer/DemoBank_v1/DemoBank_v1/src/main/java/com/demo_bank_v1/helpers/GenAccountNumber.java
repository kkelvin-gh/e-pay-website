package com.demo_bank_v1.helpers;

import java.util.Random;

public class GenAccountNumber
{
    public static int generateAccountNumber()
    {
        int accountNumber;

        Random rand = new Random();

        int bound = 1000;
        accountNumber = bound * rand.nextInt(bound);
        return accountNumber;
    }


}
