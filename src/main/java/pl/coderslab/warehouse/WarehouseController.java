package pl.coderslab.warehouse;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.delivery.Delivery;
import pl.coderslab.delivery.DeliveryRepository;
import pl.coderslab.products.Product;
import pl.coderslab.quantity.Quantity;
import pl.coderslab.quantity.QuantityRepository;

import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping("/warehouse")
@RequiredArgsConstructor
public class WarehouseController {
    private final WarehouseRepository warehouseRepository;
    private final QuantityRepository quantityRepository;
    private final DeliveryRepository deliveryRepository;

    @ModelAttribute("warehouses")
    public List<Warehouse> getAllWarehouses(){
        return warehouseRepository.findAll();
    }

    @RequestMapping("/all")
    public String all(Model model){
        model.addAttribute("warehouses", warehouseRepository.findAll());
        return "/warehouse/all";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable long id){
        model.addAttribute("warehouse", warehouseRepository.findById(id));
        return "warehouse/edit";
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid Warehouse warehouse, BindingResult result) {
        if(result.hasErrors()){
            return "warehouse/edit";
        }
        warehouseRepository.save(warehouse);
        return "redirect:/warehouse/all";
    }

    @GetMapping("/confirm")
    public String confirm(){
        return "warehouse/confirm";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable long id){
        Warehouse warehouse = warehouseRepository.getOne(id);
        List<Quantity> quantityList = quantityRepository.findAllProductsWarehouse(warehouse);
        for (Quantity quantity: quantityList) {
            if (quantity.getQuantity() == 0) {
                quantityRepository.delete(quantity);
            }
        }
        List<Quantity> quantityListUpdated = quantityRepository.findAllProductsWarehouse(warehouse);
        if(quantityListUpdated.size() > 0){
            return "/cantDelete";
        }
        List<Delivery> deliveryList = deliveryRepository.findAllDeliveryForWarehouse(warehouse);
        if(deliveryList.size() > 0){
            return "/cantDeleteDeliveries";
        }
        warehouseRepository.delete(warehouse);
        return "redirect:/warehouse/all";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("warehouse", new Warehouse());
        return "warehouse/add";
    }

    @PostMapping("/add")
    public String save(@Valid Warehouse warehouse, BindingResult result) {
        if(result.hasErrors()){
            return "warehouse/add";
        }
        warehouseRepository.save(warehouse);
        return "redirect:/warehouse/all";
    }

    @GetMapping("/{id}")
    public String stock(Model model, @PathVariable long id){
        Optional<Warehouse> warehouse = warehouseRepository.findById(id);
        List<Quantity> all = quantityRepository.findAllProductsWarehouse(warehouse.get());
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
            allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("warehouse",warehouse.get().getName());
        return "warehouse/stock";
    }



}
