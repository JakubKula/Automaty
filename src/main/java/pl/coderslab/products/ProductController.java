package pl.coderslab.products;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;



@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
    private final ProductRepository productRepository;

    @ModelAttribute("type")
    public List<String> getAllPublishers(){
        List<String> typeList = Arrays.asList(new String[]{"puszka", "PET", "snak"});
        return typeList;
    }

    @RequestMapping("/all")
    public String all(Model model){
        model.addAttribute("items", productRepository.findAll());
        return "/product/all";
    }
    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("product", new Product());
        return "product/add";
    }

    @PostMapping("/add")
    public String save(@Valid Product product, BindingResult result) {
        if(result.hasErrors()){
            return "product/add";
        }
        productRepository.save(product);
        return "redirect:/product/all";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable long id){
        model.addAttribute("product", productRepository.findById(id));
        return "product/edit";
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid Product product, BindingResult result) {
        if(result.hasErrors()){
            return "product/edit";
        }
        productRepository.save(product);
        return "redirect:/product/all";
    }

    @GetMapping("/confirm")
    public String confirm(){
        return "product/confirm";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable long id){
        productRepository.delete(productRepository.getOne(id));
        return "redirect:/product/all";
    }
}
