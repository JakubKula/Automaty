package pl.coderslab.users;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;



@Controller
public class UserController {
   private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


//    @GetMapping("/create-user")
//    @ResponseBody
//    public String createUser() {
//        User user = new User();
//        user.setEnabled(1);
//        user.setUsername("123");
//        user.setPassword("123");
//        userService.saveUser(user);
//        return "admin";
//    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(){
        return "users/login";
    }

    @GetMapping("/logout")
    public String logout(){
        return "users/logout";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "users/register";
    }
    @PostMapping("/register")
    public String register(@Valid User user, BindingResult result){
        if(result.hasErrors()){
            return "users/register";
        }
        userService.saveUser(user);
        return "redirect:login";
    }

    @GetMapping("/admin")
    @ResponseBody
    public String admin(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        return "Hello " + entityUser.getUsername();
    }

}
