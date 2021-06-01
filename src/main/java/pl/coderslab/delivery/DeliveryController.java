package pl.coderslab.delivery;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.cars.Car;
import pl.coderslab.cars.CarRepository;
import pl.coderslab.products.Product;
import pl.coderslab.products.ProductRepository;
import pl.coderslab.warehouse.Warehouse;
import pl.coderslab.warehouse.WarehouseRepository;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryController {
    private final DeliveryRepository deliveryRepository;
    private final ProductRepository productRepository;
    private final CarRepository carRepository;
    private final WarehouseRepository warehouseRepository;


    @ModelAttribute("products")
    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }

    @ModelAttribute("cars")
    public List<Car> getAllCars(){
        return carRepository.findAll();
    }

    @ModelAttribute("type")
    public List<String> getAllTypes(){
        List<String> typeList = Arrays.asList(new String[]{"DOSTAWA", "ZAŁADUNEK"});
        return typeList;
    }

    @ModelAttribute("warehouses")
    public List<Warehouse> getAllWarehouses(){
        return warehouseRepository.findAll();
    }

    @GetMapping("/delivery")
    public String delivery(Model model) {
        model.addAttribute("delivery", new Delivery());
        return "warehouse/delivery";
    }

    @PostMapping("/delivery")
    public String delivery(@Valid Delivery delivery, BindingResult result) {
        if (result.hasErrors()) {
            return "warehouse/delivery";
        }
        delivery.setData(LocalDateTime.now());
        delivery.setType("DELIVERY");
        //set user
        deliveryRepository.save(delivery);
        return "redirect:warehouse/all";
    }

    @GetMapping("/car/delivery")
    public String carDelivery(Model model) {
        model.addAttribute("delivery", new Delivery());
        return "warehouse/car/delivery";
    }

    @PostMapping("/car/delivery")
    public String carDelivery(@Valid Delivery delivery, BindingResult result) {
        if (result.hasErrors()) {
            return "warehouse/car/delivery";
        }
        delivery.setData(LocalDateTime.now());
        delivery.setType("ZAŁADUNEK");
        //set user
        deliveryRepository.save(delivery);
        return "redirect:/";
    }
}
