package com.example.demo.service;

import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.domain.UserTemp;
import com.example.demo.repos.UserRepo;
import com.example.demo.repos.UserTempRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    private final UserRepo userRepo;

    private final UserTempRepo userTempRepo;

    private final MailSender mailSender;

    @Value("${address.custom.domain}")
    private String addressCustomDomain;

    @Autowired
    public UserService(UserRepo userRepo, UserTempRepo userTempRepo, MailSender mailSender) {
        this.userRepo = userRepo;
        this.userTempRepo = userTempRepo;
        this.mailSender = mailSender;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
            return false;
        }

        UserTemp userTemp = new UserTemp();
        userTemp.setUsername(user.getUsername());
        userTemp.setPassword(user.getPassword());
        userTemp.setEmail(user.getEmail());
        userTemp.setActivationCode(UUID.randomUUID().toString());
        userTempRepo.save(userTemp);


        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "To activate, click on this link: http://" + addressCustomDomain + "/activate/%s",
                    userTemp.getUsername(),
                    userTemp.getActivationCode()
            );

            mailSender.send(userTemp.getEmail(), "Activation code", message);
        }

        return true;
    }

    public boolean activateUser(String code) {
        UserTemp userTemp = userTempRepo.findByActivationCode(code);

        if (userTemp == null) {
            return false;
        }

        User user = new User();
        user.setUsername(userTemp.getUsername());
        user.setPassword(userTemp.getPassword());
        user.setEmail(userTemp.getEmail());
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        userTempRepo.delete(userTemp);

        return true;
    }
}
