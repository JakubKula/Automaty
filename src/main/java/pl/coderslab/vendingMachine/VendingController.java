package pl.coderslab.vendingMachine;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.delivery.Delivery;
import pl.coderslab.delivery.VendingDelivery;
import pl.coderslab.delivery.VendingDeliveryRepository;
import pl.coderslab.prices.Price;
import pl.coderslab.prices.PriceRepository;
import pl.coderslab.products.Product;
import pl.coderslab.quantity.Quantity;
import pl.coderslab.quantity.QuantityRepository;
import pl.coderslab.warehouse.Warehouse;


import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/vending")
@RequiredArgsConstructor
public class VendingController {
    private final VendingRepository vendingRepository;
    private final QuantityRepository quantityRepository;
    private final VendingDeliveryRepository vendingDeliveryRepository;
    private final PriceRepository priceRepository;

    @ModelAttribute("vendings")
    public List<Vending> getAllVendings(){
        return vendingRepository.findAll();
    }

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
        List<Vending> list = vendingRepository.findAll();
        for(Vending vending1 : list){
            if(vending1.getNumber() == (vending.getNumber())){
                result.rejectValue("number", "error.number", "Podaj numer który nie jest w użyciu!");
                return "vending/add";
            }
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
        Vending vending = vendingRepository.getOne(id);
        List<Quantity> quantityList = quantityRepository.findAllProductsVending(vending);
        for (Quantity quantity: quantityList) {
            if (quantity.getQuantity() == 0) {
                quantityRepository.delete(quantity);
            }
        }
        List<Quantity> quantityListUpdated = quantityRepository.findAllProductsVending(vending);
        if(quantityListUpdated.size() > 0){
            return "/cantDelete";
        }
        List<VendingDelivery> vendingDeliveryList = vendingDeliveryRepository.findAllVendingDeliveryForVending(vending);
        if(vendingDeliveryList.size() > 0){
            return "/cantDeleteDeliveries";
        }
        vendingRepository.delete(vending);
        return "redirect:/vending/all";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("vending", new Vending());
        return "vending/add";
    }

    @PostMapping("/add")
    public String save(@Valid Vending vending, BindingResult result) {
        if(result.hasErrors()){
            return "vending/add";
        }
        List<Vending> list = vendingRepository.findAll();
        for(Vending vending1 : list){
            if(vending1.getNumber() == (vending.getNumber())){
                result.rejectValue("number", "error.number", "Podaj numer który nie jest w użyciu!");
                return "vending/add";
            }
        }
        vending.setCash(0.0);
        vendingRepository.save(vending);
        return "redirect:/vending/all";
    }

    @GetMapping("/{id}")
    public String stock(Model model, @PathVariable long id){
        Vending vending = vendingRepository.getOne(id);
        List<Quantity> all = quantityRepository.findAllProductsVending(vending);
        Float value = 0.00F;
        Map<Product, Integer> allProducts = new HashMap<>();
        List<Price> priceList = priceRepository.findAllPricesForVending(vending);
        Map<Product, Float> allProductsPrices = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
            for(Price price: priceList){
                if(quantity.getProduct().equals(price.getProduct())){
                    value += quantity.getQuantity() * price.getPrice();
                }
            }
        }
        for(Price price: priceList){
            allProductsPrices.put(price.getProduct(), price.getPrice());
        }
        model.addAttribute("value",value);
        model.addAttribute("allProductsPrices",allProductsPrices);
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("vending",vending);
        return "vending/stock";
    }

    @GetMapping("/chooseVending")
    public String chooseVending(Model model) {
        model.addAttribute("vendingDelivery", new VendingDelivery());
        return "/vending/chooseVending1";
    }
}
