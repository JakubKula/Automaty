package pl.coderslab.delivery;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cars.Car;
import pl.coderslab.cars.CarRepository;
import pl.coderslab.prices.PriceRepository;
import pl.coderslab.products.Product;
import pl.coderslab.products.ProductRepository;
import pl.coderslab.quantity.Quantity;
import pl.coderslab.quantity.QuantityRepository;
import pl.coderslab.users.CurrentUser;
import pl.coderslab.users.User;
import pl.coderslab.users.UserRepository;
import pl.coderslab.vendingMachine.Vending;
import pl.coderslab.vendingMachine.VendingRepository;
import pl.coderslab.warehouse.Warehouse;
import pl.coderslab.warehouse.WarehouseRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryController {
    private final DeliveryRepository deliveryRepository;
    private final ProductRepository productRepository;
    private final CarRepository carRepository;
    private final WarehouseRepository warehouseRepository;
    private final QuantityRepository quantityRepository;
    private final VendingDeliveryRepository vendingDeliveryRepository;
    private final VendingRepository vendingRepository;
    private final UserRepository userRepository;
    private final PriceRepository priceRepository;


    @ModelAttribute("productsAvailable")
    public Map<Product, Integer> getAvailableProducts(){
        Optional<Warehouse> warehouse = warehouseRepository.findById(1L);
        List<Quantity> all = quantityRepository.findAllProductsWarehouse(warehouse.get());
        Map<Product, Integer> availableProducts = new HashMap<>();
        for(Quantity quantity : all){
            availableProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        return availableProducts;
    }
    public Map<Product, Integer> getAvailableProductsCar(Car car){
        List<Quantity> all = quantityRepository.findAllProductsCar(car);
        Map<Product, Integer> availableProducts = new HashMap<>();
        for(Quantity quantity : all){
            availableProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        return availableProducts;
    }

    @ModelAttribute("deliveries")
    public List<Delivery> getAllDeliveries(){
        return deliveryRepository.findAll();
    }

    @ModelAttribute("formatter")
    public DateTimeFormatter getFormatter(){
        return DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    }

    @ModelAttribute("why")
    public List<String> whyDelete(){
        return Arrays.asList("Przeterminowane", "Zniszczone", "Zjedzone", "Sprzedane");
    }

    @ModelAttribute("users")
    public List<User> getAllUsers(){
        return userRepository.findAll();
    }
    
    @ModelAttribute("products")
    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }

    @ModelAttribute("vendings")
    public List<Vending> getAllVendings(){
        return vendingRepository.findAll();
    }

    @ModelAttribute("cars")
    public List<Car> getAllCars(){
        return carRepository.findAll();
    }

    @ModelAttribute("type")
    public List<String> getAllTypes(){
        return Arrays.asList("DOSTAWA", "ZAŁADUNEK");
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
    public String delivery(@Valid Delivery delivery, BindingResult result, @AuthenticationPrincipal CurrentUser customUser) {
        if (result.hasErrors()) {
            System.out.println(result);
            //zamiana number fomrmat exeption !!!!
            return "warehouse/delivery";
        }
        List<Quantity> list = quantityRepository.findAllProductsWarehouse(delivery.getWarehouse());
        delivery.setData(LocalDateTime.now());
        delivery.setType("DELIVERY");
        User user = customUser.getUser();
        delivery.setAmount(delivery.getProduct().getPackSize() * delivery.getAmount());
        delivery.setUser(user);
        deliveryRepository.save(delivery);
        boolean newProduct = addQuantity(delivery, list);
        if(newProduct){
            Quantity quantity = new Quantity();
            quantity.setProduct(delivery.getProduct());
            quantity.setQuantity(delivery.getAmount());
            quantity.setWarehouse(delivery.getWarehouse());
            quantity.setData(LocalDateTime.now());
            quantityRepository.save(quantity);
        }
        return "redirect:/warehouse/" + delivery.getWarehouse().getId();

    }


    private boolean addQuantity(@Valid Delivery delivery, List<Quantity> list) {
        boolean newProduct = true;
        for(Quantity quantity: list){
            if(quantity.getProduct().equals(delivery.getProduct())){
                quantity.setQuantity(quantity.getQuantity() + delivery.getAmount());
                quantity.setData(LocalDateTime.now());
                quantityRepository.save(quantity);
                newProduct = false;
            }
        }
        return newProduct;
    }

    @GetMapping("/car/delivery")
    public String carDelivery(Model model) {
        model.addAttribute("delivery", new Delivery());
        return "/car/delivery";
    }

    @PostMapping("/car/delivery")
    public String carDelivery(@Valid Delivery delivery, BindingResult result, @AuthenticationPrincipal CurrentUser customUser) {
        if (result.hasErrors()) {
            return "/car/delivery";
        }
        List<Quantity> list = quantityRepository.findAllProductsWarehouse(delivery.getWarehouse());
        for(Quantity quantity : list){
            if(delivery.getProduct().equals(quantity.getProduct())){
                if(quantity.getQuantity() < delivery.getAmount()){
                    result.rejectValue("amount", "error.amount", "Podaj wartość która jest dostępna na magazynie!");
                    return "car/delivery";
                }
            }
        }
        delivery.setData(LocalDateTime.now());
        delivery.setType("ZAŁADUNEK");
        User user = customUser.getUser();
        delivery.setUser(user);
        delivery.setAmount(delivery.getAmount() * delivery.getProduct().getPackSize());
        deliveryRepository.save(delivery);
        List<Quantity> listWarehouse = quantityRepository.findAllProductsWarehouse(delivery.getWarehouse());
        for(Quantity quantity: listWarehouse){
            if(quantity.getProduct().equals(delivery.getProduct())){
                quantity.setQuantity(quantity.getQuantity() - delivery.getAmount());
                quantity.setData(LocalDateTime.now());
                quantityRepository.save(quantity);
            }
        }
        List<Quantity> listCar = quantityRepository.findAllProductsCar(delivery.getCar());
        boolean newProduct = addQuantity(delivery, listCar);
        if(newProduct){
            Quantity quantity = new Quantity();
            quantity.setProduct(delivery.getProduct());
            quantity.setQuantity(delivery.getAmount());
            quantity.setCar(delivery.getCar());
            quantity.setData(LocalDateTime.now());
            quantityRepository.save(quantity);
        }
        return "redirect:/car/"+ delivery.getCar().getId();
    }
    @GetMapping("/warehouse/delete")
    public String stock(Model model){
        Optional<Warehouse> warehouse = warehouseRepository.findById(1L);
        List<Quantity> all = quantityRepository.findAllProductsWarehouse(warehouse.get());
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("warehouse",warehouse.get().getName());
        model.addAttribute("delivery", new Delivery());
        model.addAttribute("why", Arrays.asList("Przeterminowane", "Zniszczone", "Zjedzone", "Sprzedane"));
        return "warehouse/delete";
    }

    @PostMapping("/warehouse/delete")
    public String warehouseDelete(@Valid Delivery delivery, BindingResult result, @AuthenticationPrincipal CurrentUser customUser, Model model) {
        Optional<Warehouse> warehouse = warehouseRepository.findById(1L);
        List<Quantity> all = quantityRepository.findAllProductsWarehouse(warehouse.get());
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("warehouse",warehouse.get().getName());
        if (result.hasErrors()) {
            return "/warehouse/delete";
        }
        List<Quantity> list = quantityRepository.findAllProductsWarehouse(delivery.getWarehouse());
        for(Quantity quantity : list){
            if(delivery.getProduct().equals(quantity.getProduct())){
                if(quantity.getQuantity() < delivery.getAmount()){
                    result.rejectValue("amount", "error.amount", "Podaj wartość która jest dostępna na magazynie!");
                    return "warehouse/delete";
                }
            }
        }
        delivery.setData(LocalDateTime.now());
        User user = customUser.getUser();
        delivery.setUser(user);
        deliveryRepository.save(delivery);
        List<Quantity> listWarehouse = quantityRepository.findAllProductsWarehouse(delivery.getWarehouse());
        for(Quantity quantity: listWarehouse){
            if(quantity.getProduct().equals(delivery.getProduct())){
                quantity.setQuantity(quantity.getQuantity() - delivery.getAmount());
                quantity.setData(LocalDateTime.now());
                quantityRepository.save(quantity);
            }
        }
        return "redirect:/warehouse/"+ delivery.getWarehouse().getId();
    }

    @GetMapping("/vending/delivery")
    public String vendingDelivery(Model model, @Valid VendingDelivery vendingDelivery, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("car", vendingDelivery.getCar());
        model.addAttribute("vendingDelivery", new VendingDelivery());
        model.addAttribute("car", vendingDelivery.getCar());
        model.addAttribute("productsAvailable", getAvailableProductsCar(vendingDelivery.getCar()));
        return "/vending/delivery";
    }

    @PostMapping("/vending/delivery")
    public String vendingDelivery(@Valid VendingDelivery vendingDelivery, BindingResult result, HttpServletRequest request, @AuthenticationPrincipal CurrentUser customUser, Model model) {
        HttpSession session = request.getSession();
        model.addAttribute("car", session.getAttribute("car"));
        model.addAttribute("productsAvailable", getAvailableProductsCar((Car) session.getAttribute("car")));
        if (result.hasErrors()) {
            return "/vending/delivery";
        }
        List<Quantity> listCar = quantityRepository.findAllProductsCar((Car) session.getAttribute("car"));
        for(Quantity quantity : listCar){
            if(vendingDelivery.getProduct().equals(quantity.getProduct())){
                if(quantity.getQuantity() < vendingDelivery.getAmount()){
                    result.rejectValue("amount", "error.amount", "Podaj wartość która jest dostępna na samochodzie!");
                    return "vending/delivery";
                }
            }
        }
        for(Quantity quantity: listCar) {
            if (quantity.getProduct().equals(vendingDelivery.getProduct())) {
                quantity.setQuantity(quantity.getQuantity() - vendingDelivery.getAmount());
                quantity.setData(LocalDateTime.now());
                quantityRepository.save(quantity);
            }
        }
        vendingDelivery.setData(LocalDateTime.now());
        vendingDelivery.setType("ZAŁADUNEK");
        User user = customUser.getUser();
        vendingDelivery.setUser(user);
        vendingDelivery.setCar((Car) session.getAttribute("car"));
        List<Quantity> listVending = quantityRepository.findAllProductsVending(vendingDelivery.getVending());
        boolean newProduct = true;
        for(Quantity quantity1: listVending){
            if(quantity1.getProduct().equals(vendingDelivery.getProduct())){
                quantity1.setQuantity(quantity1.getQuantity() + vendingDelivery.getAmount());
                quantity1.setData(LocalDateTime.now());
                quantityRepository.save(quantity1);
                newProduct = false;
            }
        }
        if(newProduct){
            Quantity quantity2 = new Quantity();
            quantity2.setProduct(vendingDelivery.getProduct());
            quantity2.setQuantity(vendingDelivery.getAmount());
            quantity2.setVending(vendingDelivery.getVending());
            quantity2.setData(LocalDateTime.now());
            quantityRepository.save(quantity2);
        }
        vendingDeliveryRepository.save(vendingDelivery);
        return "redirect:/vending/"+ vendingDelivery.getVending().getId();
    }

    @GetMapping("/chooseCar")
    public String choose(Model model) {
        model.addAttribute("vendingDelivery", new VendingDelivery());
        return "/vending/chooseCar";
    }

    @GetMapping("/chooseCar1")
    public String choose2(Model model) {
        model.addAttribute("vendingDelivery", new VendingDelivery());
        return "/car/chooseCar";
    }

    @GetMapping("delete/car/product")
    public String deleteCarProduct(Model model, @Valid VendingDelivery vendingDelivery, HttpServletRequest request){
        List<Quantity> all = quantityRepository.findAllProductsCar(vendingDelivery.getCar());
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        HttpSession session = request.getSession();
        session.setAttribute("car", vendingDelivery.getCar());
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("car",vendingDelivery.getCar());
        model.addAttribute("delivery", new Delivery());
        return "car/delete";
    }
    @PostMapping("delete/car/product")
    public String deleteCarProduct(@Valid Delivery delivery, BindingResult result, @AuthenticationPrincipal CurrentUser customUser, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Quantity> all = quantityRepository.findAllProductsCar((Car) session.getAttribute("car"));
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("car",session.getAttribute("car"));
        if (result.hasErrors()) {
            return "/car/delete";
        }
        List<Quantity> list = quantityRepository.findAllProductsCar((Car) session.getAttribute("car"));
        for(Quantity quantity : list){
            if(delivery.getProduct().equals(quantity.getProduct())){
                if(quantity.getQuantity() < delivery.getAmount()){
                    result.rejectValue("amount", "error.amount", "Podaj wartość która jest dostępna na samochodzie!");
                    return "car/delete";
                }
            }
        }
        delivery.setCar((Car) session.getAttribute("car"));
        delivery.setData(LocalDateTime.now());
        User user = customUser.getUser();
        delivery.setUser(user);
        deliveryRepository.save(delivery);
        for(Quantity quantity: list){
            if(quantity.getProduct().equals(delivery.getProduct())){
                quantity.setQuantity(quantity.getQuantity() - delivery.getAmount());
                quantity.setData(LocalDateTime.now());
                quantityRepository.save(quantity);
            }
        }
        return "redirect:/car/"+ ((Car) session.getAttribute("car")).getId();
    }

    @GetMapping("/chooseVending")
    public String chooseVending(Model model) {
        model.addAttribute("vendingDelivery", new VendingDelivery());
        return "/vending/chooseVending";
    }

    @GetMapping("delete/vending/product")
    public String deleteVendingProduct(Model model, @Valid VendingDelivery vendingDelivery, HttpServletRequest request){
        List<Quantity> all = quantityRepository.findAllProductsVending(vendingDelivery.getVending());
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        HttpSession session = request.getSession();
        session.setAttribute("vending", vendingDelivery.getVending());
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("vending",vendingDelivery.getVending());
        model.addAttribute("delivery", new VendingDelivery());
        return "vending/delete";
    }
    @PostMapping("delete/vending/product")
    public String deleteVendingProduct(@Valid VendingDelivery vendingDelivery, BindingResult result, @AuthenticationPrincipal CurrentUser customUser, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Quantity> all = quantityRepository.findAllProductsVending((Vending) session.getAttribute("vending"));
        Map<Product, Integer> allProducts = new HashMap<>();
        for(Quantity quantity : all){
            if(quantity.getQuantity() != 0)
                allProducts.put(quantity.getProduct(), quantity.getQuantity());
        }
        model.addAttribute("allProducts",allProducts);
        model.addAttribute("vending",session.getAttribute("vending"));
        if (result.hasErrors()) {
            return "/vending/delete";
        }
        List<Quantity> list = quantityRepository.findAllProductsVending((Vending) session.getAttribute("vending"));
        for(Quantity quantity : list){
            if(vendingDelivery.getProduct().equals(quantity.getProduct())){
                if(quantity.getQuantity() < vendingDelivery.getAmount()){
                    result.rejectValue("amount", "error.amount", "Podaj wartość która jest dostępna na automacie!");
                    return "vending/delete";
                }
            }
        }
        Vending vending = (Vending) session.getAttribute("vending");
        if(vendingDelivery.getType().equals("Sprzedane")){
            Double cash = vending.getCash();
            Float price = priceRepository.findPricesForVendingProduct(vending, vendingDelivery.getProduct());
            cash += vendingDelivery.getAmount()*price;
            vending.setCash(cash);
            vendingRepository.save(vending);
        }
        vendingDelivery.setVending(vending);
        vendingDelivery.setData(LocalDateTime.now());
        User user = customUser.getUser();
        vendingDelivery.setUser(user);

        vendingDeliveryRepository.save(vendingDelivery);
        for(Quantity quantity: list){
            if(quantity.getProduct().equals(vendingDelivery.getProduct())){
                quantity.setQuantity(quantity.getQuantity() - vendingDelivery.getAmount());
                quantity.setData(LocalDateTime.now());
                quantityRepository.save(quantity);
            }
        }
        return "redirect:/vending/"+ ((Vending) session.getAttribute("vending")).getId();
    }

    @GetMapping("/all/delivery")
    public String allDelivery(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        User user = customUser.getUser();
        sortForUser(user, model);
        return "/delivery/all";
    }

    @GetMapping("/choose/user")
    public String chooseUser(Model model) {
        model.addAttribute("vendingDelivery", new VendingDelivery());
        return "/users/choose";
    }

    @GetMapping("/user/delivery")
    public String userDelivery(Model model, @Valid VendingDelivery vendingDelivery) {
        User user = vendingDelivery.getUser();
        sortForUser(user, model);
        return "/delivery/all";
    }

    private void sortForUser(User user, Model model){
        List<Delivery> allDelivery = deliveryRepository.findAllDeliveryForUser(user);
        List<VendingDelivery> allVendingDelivery = vendingDeliveryRepository.findAllVendingDeliveryForUser(user);
        sortFor(model, allDelivery, allVendingDelivery);
        model.addAttribute("user", user);
    }

    @GetMapping("/for/all/delivery")
    public String allDelivery(Model model) {
        sortFor(model, deliveryRepository.findAllDelivery(), vendingDeliveryRepository.findAllVendingDelivery());
        return "/delivery/forAll";
    }

    private void sortFor(Model model, List<Delivery> allDelivery, List<VendingDelivery> allVendingDelivery){
        List<Delivery> listDeliveryCar = new ArrayList<>();
        List<Delivery> listZaladunek = new ArrayList<>();
        List<Delivery> listZniszczone = new ArrayList<>();
        List<Delivery> listPrzeterminowane = new ArrayList<>();
        List<Delivery> listSprzedane = new ArrayList<>();
        List<Delivery> listZjedzone = new ArrayList<>();
        for(Delivery delivery: allDelivery) {
            switch (delivery.getType()) {
                case "DELIVERY":
                    listDeliveryCar.add(delivery);
                    break;
                case "ZAŁADUNEK":
                    listZaladunek.add(delivery);
                    break;
                case "Zniszczone":
                    listZniszczone.add(delivery);
                    break;
                case "Przeterminowane":
                    listPrzeterminowane.add(delivery);
                    break;
                case "Sprzedane":
                    listSprzedane.add(delivery);
                    break;
                case "Zjedzone":
                    listZjedzone.add(delivery);
                    break;
            }
        }
        List<VendingDelivery> listZaladunekVending = new ArrayList<>();
        List<VendingDelivery> listZniszczoneVending = new ArrayList<>();
        List<VendingDelivery> listPrzeterminowaneVending = new ArrayList<>();
        List<VendingDelivery> listSprzedaneVending = new ArrayList<>();
        List<VendingDelivery> listZjedzoneVending = new ArrayList<>();
        for(VendingDelivery vendingDelivery1: allVendingDelivery) {
            switch (vendingDelivery1.getType()) {
                case "ZAŁADUNEK":
                    listZaladunekVending.add(vendingDelivery1);
                    break;
                case "Zniszczone":
                    listZniszczoneVending.add(vendingDelivery1);
                    break;
                case "Przeterminowane":
                    listPrzeterminowaneVending.add(vendingDelivery1);
                    break;
                case "Sprzedane":
                    listSprzedaneVending.add(vendingDelivery1);
                    break;
                case "Zjedzone":
                    listZjedzoneVending.add(vendingDelivery1);
                    break;
            }
        }
        model.addAttribute("Delivery", listDeliveryCar);
        model.addAttribute("Zaladunek", listZaladunek);
        model.addAttribute("Zniszczone", listZniszczone);
        model.addAttribute("Przeterminowane", listPrzeterminowane);
        model.addAttribute("Sprzedane", listSprzedane);
        model.addAttribute("Zjedzone", listZjedzone);

        model.addAttribute("zaladunekV", listZaladunekVending);
        model.addAttribute("ZniszczoneV", listZniszczoneVending);
        model.addAttribute("PrzeterminowaneV", listPrzeterminowaneVending);
        model.addAttribute("SprzedaneV", listSprzedaneVending);
        model.addAttribute("ZjedzoneV", listZjedzoneVending);
    }

    @GetMapping("/confirm")
    public String confirm(){
        return "delivery/confirm";
    }
    @GetMapping("/confirm1")
    public String confirm1(){
        return "delivery/confirm1";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable long id){
        Delivery delivery = deliveryRepository.getOne(id);
        if(delivery.getType().equals("DELIVERY")){
            Warehouse warehouse = delivery.getWarehouse();
            List<Quantity> quantityList = quantityRepository.findAllProductsWarehouse(warehouse);
            for(Quantity quantity: quantityList){
                if(quantity.getProduct().equals(delivery.getProduct())){
                    quantity.setQuantity(quantity.getQuantity() - delivery.getAmount());
                }
            }
        }else if(delivery.getType().equals("ZAŁADUNEK")){
            Warehouse warehouse = delivery.getWarehouse();
            List<Quantity> quantityList = quantityRepository.findAllProductsWarehouse(warehouse);
            for(Quantity quantity: quantityList){
                if(quantity.getProduct().equals(delivery.getProduct())){
                    quantity.setQuantity(quantity.getQuantity() + delivery.getAmount());
                }
            }
            Car car = delivery.getCar();
            List<Quantity> quantityListCar = quantityRepository.findAllProductsCar(car);
            for(Quantity quantity: quantityListCar){
                if(quantity.getProduct().equals(delivery.getProduct())){
                    quantity.setQuantity(quantity.getQuantity() - delivery.getAmount());
                }
            }
        }else if(delivery.getType().equals("Przeterminowane") || delivery.getType().equals("Zniszczone") ||
                delivery.getType().equals("Sprzedane") || delivery.getType().equals("Zjedzone")) {
            Warehouse warehouse = delivery.getWarehouse();
            List<Quantity> quantityList = quantityRepository.findAllProductsWarehouse(warehouse);
            for (Quantity quantity : quantityList) {
                if (quantity.getProduct().equals(delivery.getProduct())) {
                    quantity.setQuantity(quantity.getQuantity() + delivery.getAmount());
                }
            }
            Car car = delivery.getCar();
            List<Quantity> quantityListCar = quantityRepository.findAllProductsCar(car);
            for (Quantity quantity : quantityListCar) {
                if (quantity.getProduct().equals(delivery.getProduct())) {
                    quantity.setQuantity(quantity.getQuantity() + delivery.getAmount());
                }
            }
        }
        deliveryRepository.delete(delivery);
        return "redirect:/delivery/for/all/delivery";
    }

    @GetMapping("/remove1/{id}")
    public String remove1(@PathVariable long id){
        VendingDelivery vendingDelivery  = vendingDeliveryRepository.getOne(id);
        Vending vending = vendingDelivery.getVending();
        List<Quantity> quantityList = quantityRepository.findAllProductsVending(vending);
        Car car = vendingDelivery.getCar();
        List<Quantity> quantityListCar = quantityRepository.findAllProductsCar(car);
        if(vendingDelivery.getType().equals("ZAŁADUNEK")){
            for(Quantity quantity: quantityList){
                if(quantity.getProduct().equals(vendingDelivery.getProduct())){
                    quantity.setQuantity(quantity.getQuantity() - vendingDelivery.getAmount());
                }
            }
            for(Quantity quantity: quantityListCar){
                if(quantity.getProduct().equals(vendingDelivery.getProduct())){
                    quantity.setQuantity(quantity.getQuantity() + vendingDelivery.getAmount());
                }
            }
        }else if(vendingDelivery.getType().equals("Przeterminowane") || vendingDelivery.getType().equals("Zniszczone") ||
                vendingDelivery.getType().equals("Sprzedane") || vendingDelivery.getType().equals("Zjedzone")) {
            for (Quantity quantity : quantityList) {
                if (quantity.getProduct().equals(vendingDelivery.getProduct())) {
                    quantity.setQuantity(quantity.getQuantity() + vendingDelivery.getAmount());
                }
            }
            for (Quantity quantity : quantityListCar) {
                if (quantity.getProduct().equals(vendingDelivery.getProduct())) {
                    quantity.setQuantity(quantity.getQuantity() + vendingDelivery.getAmount());
                }
            }
        }
        vendingDeliveryRepository.delete(vendingDelivery);
        return "redirect:/delivery/for/all/delivery";
    }
}
