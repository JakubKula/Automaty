package pl.coderslab.warehouse;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.delivery.Delivery;
import pl.coderslab.delivery.DeliveryRepository;
import pl.coderslab.products.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/warehouse")
@RequiredArgsConstructor
public class WarehouseController {
    private final WarehouseRepository warehouseRepository;
    private final DeliveryRepository deliveryRepository;


    @RequestMapping("/all/{id}")
    public String all(Model model, @PathVariable Long id){
        Optional<Warehouse> warehouse = warehouseRepository.findById(id);
        List<Delivery> all = deliveryRepository.findAllDelivery(warehouse.get());
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Delivery delivery: all){
            if(allProducts.containsKey(delivery.getProduct())){
                Integer amount = allProducts.get(delivery.getProduct());
                if(delivery.getType().equals("DELIVERY")){
                    amount += delivery.getAmount();
                }else if(delivery.getType().equals("ZAŁADUNEK")){
                    amount -= delivery.getAmount();
                }
                allProducts.put(delivery.getProduct(), amount);
            }else{
                Product product = delivery.getProduct();
                Integer amount = delivery.getAmount();
                allProducts.put(product, amount);
            }
        }
        model.addAttribute("allProducts", allProducts);
        return "warehouse/all";
    }


}
