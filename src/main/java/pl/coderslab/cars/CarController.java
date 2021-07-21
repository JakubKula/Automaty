package pl.coderslab.cars;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.delivery.Delivery;
import pl.coderslab.delivery.DeliveryRepository;
import pl.coderslab.delivery.VendingDelivery;
import pl.coderslab.delivery.VendingDeliveryRepository;
import pl.coderslab.products.Product;
import pl.coderslab.quantity.Quantity;
import pl.coderslab.quantity.QuantityRepository;



import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping("/car")
@RequiredArgsConstructor
public class CarController {
    private final CarRepository carRepository;
    private final QuantityRepository quantityRepository;
    private final DeliveryRepository deliveryRepository;
    private final VendingDeliveryRepository vendingDeliveryRepository;

    @ModelAttribute("cars")
    public List<Car> getAllCars(){
        List<Car> carList = carRepository.findAll();
        return carList;
    }

    @RequestMapping("/all")
    public String all(Model model){
        model.addAttribute("cars", carRepository.findAll());
        return "/car/all";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable long id){
        model.addAttribute("car", carRepository.findById(id));
        return "car/edit";
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid Car car, BindingResult result) {
        if(result.hasErrors()){
            return "car/edit";
        }
        List<Car> list = carRepository.findAll();
        for(Car car1 : list){
            if(car1.getRegistration().equals(car.getRegistration())){
                result.rejectValue("registration", "error.registration", "Podaj rejestracje która nie jest w użyciu!");
                return "car/add";
            }
        }
        carRepository.save(car);
        return "redirect:/car/all";
    }

    @GetMapping("/confirm")
    public String confirm(){
        return "car/confirm";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable long id){
        Car car = carRepository.getOne(id);
        List<Quantity> quantityList = quantityRepository.findAllProductsCar(car);
        for (Quantity quantity: quantityList) {
            if (quantity.getQuantity() == 0) {
                quantityRepository.delete(quantity);
            }
        }
        List<Quantity> quantityListUpdated = quantityRepository.findAllProductsCar(car);
        if(quantityListUpdated.size() > 0){
            return "/cantDelete";
        }
        List<Delivery> deliveryList = deliveryRepository.findAllDeliveryForCar(car);
        List<VendingDelivery> vendingDeliveryList = vendingDeliveryRepository.findAllVendingDeliveryForCar(car);
        if(deliveryList.size() > 0 || vendingDeliveryList.size() > 0){
            return "/cantDeleteDeliveries";
        }
        carRepository.delete(car);
        return "redirect:/car/all";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("car", new Car());
        return "car/add";
    }

    @PostMapping("/add")
    public String save(@Valid Car car, BindingResult result) {
        if(result.hasErrors()){
            return "car/add";
        }
        List<Car> list = carRepository.findAll();
        for(Car car1 : list){
            if(car1.getRegistration().equals(car.getRegistration())){
                    result.rejectValue("registration", "error.registration", "Podaj rejestracje która nie jest w użyciu!");
                    return "car/add";
            }
        }
        carRepository.save(car);
        return "redirect:/car/all";
    }

    @GetMapping("/{id}")
    public String stock(Model model, @PathVariable long id){
        Optional<Car> car = carRepository.findById(id);
        List<Quantity> all = quantityRepository.findAllProductsCar(car.get());
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("car",car.get().getMarkRegi());
        return "car/stock";
    }
}
