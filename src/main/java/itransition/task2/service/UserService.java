package itransition.task2.service;

import itransition.task2.model.User;

/**
 * Service class for {@link User}
 *
 * @author Eugene Suleimanov
 * @version 1.0
 */

public interface UserService {

    void save(User user);

    void addRole(User user);

    User findByUsername(String username);

    User findById(Long id);
}
