package com.example.demo.repos;

import com.example.demo.domain.Email;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MailRepo extends JpaRepository<Email, Long> {
}
