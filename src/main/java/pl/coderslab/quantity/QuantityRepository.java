package pl.coderslab.quantity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.cars.Car;
import pl.coderslab.vendingMachine.Vending;
import pl.coderslab.warehouse.Warehouse;

import java.util.List;

@Repository
public interface QuantityRepository extends JpaRepository<Quantity, Long> {

    @Query("SELECT q FROM Quantity q WHERE q.warehouse =?1")
    List<Quantity> findAllProductsWarehouse(Warehouse warehouse);

    @Query("SELECT q FROM Quantity q WHERE q.car =?1")
    List<Quantity> findAllProductsCar(Car Car);

    @Query("SELECT q FROM Quantity q WHERE q.vending =?1")
    List<Quantity> findAllProductsVending(Vending vending);
}
