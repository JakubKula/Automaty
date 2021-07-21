package pl.coderslab.prices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cars.Car;
import pl.coderslab.cars.CarRepository;
import pl.coderslab.delivery.Delivery;
import pl.coderslab.delivery.DeliveryRepository;
import pl.coderslab.delivery.VendingDelivery;
import pl.coderslab.delivery.VendingDeliveryRepository;
import pl.coderslab.products.Product;
import pl.coderslab.quantity.Quantity;
import pl.coderslab.quantity.QuantityRepository;
import pl.coderslab.vendingMachine.Vending;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.Session;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/price")
@RequiredArgsConstructor
public class PriceController {
    private final QuantityRepository quantityRepository;
    private final PriceRepository priceRepository;

    @GetMapping("set/price")
    public String setPrice(Model model, @Valid VendingDelivery vendingDelivery, HttpServletRequest request){
        Vending vending = vendingDelivery.getVending();
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

        List<Quantity> all2 = quantityRepository.findAllProductsVending(vendingDelivery.getVending());
        Map<Product, Integer> allProducts2 = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        HttpSession session = request.getSession();
        session.setAttribute("vending", vendingDelivery.getVending());
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("vending",vendingDelivery.getVending());
        model.addAttribute("price", new Price());
        return "price/set";
    }

    @PostMapping("set")
    public String setPrice(@Valid Price price, BindingResult result, HttpServletRequest request){
        if(result.hasErrors()){
            return "price/set";
        }
        HttpSession session = request.getSession();
        Vending vending = (Vending) session.getAttribute("vending");
        price.setVending(vending);
        String priceF = request.getParameter("price1");
        Float priceFloat = Float.parseFloat(priceF);
        price.setPrice(priceFloat);
        List<Price> priceList = priceRepository.findAllPricesForVending(vending);
        boolean newProduct = true;
        for(Price price1: priceList){
            if(price1.getProduct().equals(price.getProduct())){
                price1.setPrice(price.getPrice());
                priceRepository.save(price1);
                newProduct = false;
            }
        }
        if(newProduct){
            priceRepository.save(price);
        }
        return "redirect:/vending/"+vending.getId();
    }
}
