package pl.coderslab.prices;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.cars.Car;
import pl.coderslab.delivery.Delivery;
import pl.coderslab.products.Product;
import pl.coderslab.users.User;
import pl.coderslab.vendingMachine.Vending;

import java.util.List;

@Repository
public interface PriceRepository extends JpaRepository<Price, Long> {

    @Query("SELECT p FROM Price p WHERE p.vending =?1")
    List<Price> findAllPricesForVending(Vending vending);

    @Query("SELECT p.price FROM Price p WHERE p.vending =?1 and p.product=?1")
    Float findPricesForVendingProduct(Vending vending, Product product);
}
