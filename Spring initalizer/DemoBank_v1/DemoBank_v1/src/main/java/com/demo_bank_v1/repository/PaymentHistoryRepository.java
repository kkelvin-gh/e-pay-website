package com.demo_bank_v1.repository;

import com.demo_bank_v1.models.PaymentHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface PaymentHistoryRepository extends CrudRepository<PaymentHistory, Integer>
{
    @Query(value = "SELECT * FROM v_payment_history WHERE user_id= :user_id", nativeQuery = true)
    List<PaymentHistory> getPaymentRecordsById(@Param("user_id") int user_id);
}
