package com.example.demo.repos;

import com.example.demo.domain.UserTemp;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserTempRepo extends JpaRepository<UserTemp, Long> {
    UserTemp findByActivationCode(String code);

}
