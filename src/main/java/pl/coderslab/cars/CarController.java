package pl.coderslab.cars;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/car")
@RequiredArgsConstructor
public class CarController {
    private final CarRepository carRepository;
    private final CarService carService;

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
        carService.updateCar(car);
        return "redirect:/car/all";
    }

    @GetMapping("/confirm")
    public String confirm(){
        return "car/confirm";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable long id){
        carRepository.delete(carRepository.getOne(id));
        return "redirect:/car/all";
    }
}
