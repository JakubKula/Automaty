package pl.coderslab.vendingMachine;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.validation.Valid;

@Controller
@RequestMapping("/vending")
@RequiredArgsConstructor
public class VendingController {
    private final VendingRepository vendingRepository;

    @RequestMapping("/all")
    public String all(Model model){
        model.addAttribute("vending", vendingRepository.findAll());
        return "/vending/all";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable long id){
        model.addAttribute("vending", vendingRepository.findById(id));
        return "vending/edit";
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid Vending vending, BindingResult result) {
        if(result.hasErrors()){
            return "vending/edit";
        }
        vendingRepository.save(vending);
        return "redirect:/vending/all";
    }

    @GetMapping("/confirm")
    public String confirm(){
        return "vending/confirm";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable long id){
        vendingRepository.delete(vendingRepository.getOne(id));
        return "redirect:/vending/all";
    }
}
