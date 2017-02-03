package itransition.task2.service;

import itransition.task2.dao.RoleDao;
import itransition.task2.dao.UserDao;
import itransition.task2.model.Role;
import itransition.task2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 *
 *
 *
 *
 */

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Override
    public void save(User user) {
        user.setPassword(user.getPassword());
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.getOne(1L));
        user.setRoles(roles);
        userDao.save(user);
        MailService mail = new MailService();
        mail.sendEmail(user.getEmail(),"http://localhost:8080/confirm?id="+user.getId());
    }

    public void addRole(User user) {
        Set<Role> roles = user.getRoles();
        roles.add(roleDao.getOne(2L));
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findById(Long id) {
        return userDao.findById(id);
    }
}
