package itransition.task2.validator;

import itransition.task2.service.UserService;
import itransition.task2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Validator for {@link User} class,
 * implements {@link Validator} interface.
 *
 * @author Eugene Suleimanov
 * @version 1.0
 */

@Component
public class UserValidator implements Validator{

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
            Pattern.compile("^[-\\w.]+@([A-z0-9][-A-z0-9]+\\.)+[A-z]{2,4}$");

    public static final Pattern VALID_LOGIN_REGEX =
            Pattern.compile("^[a-zA-Z][a-zA-Z0-9-_.]+$");

    public static final Pattern VALID_PASSWORD_REGEX =
            Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9@#$%]).{8,}$");

    public boolean validateWithRegularExpression(String string, Pattern pattern) {
        Matcher matcher = pattern .matcher(string);
        return matcher.find();
    }

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
        if (user.getUsername().length() < 2 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }

        if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        if (!validateWithRegularExpression(user.getUsername(), VALID_LOGIN_REGEX))
        {
            errors.rejectValue("username", "Regular.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }

        if (!validateWithRegularExpression(user.getPassword(), VALID_PASSWORD_REGEX))
        {
            errors.rejectValue("password", "Regular.userForm.password");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Required");
        if (!validateWithRegularExpression(user.getEmail(), VALID_EMAIL_ADDRESS_REGEX))
        {
            errors.rejectValue("email", "Regular.userForm.email");
        }
    }
}
