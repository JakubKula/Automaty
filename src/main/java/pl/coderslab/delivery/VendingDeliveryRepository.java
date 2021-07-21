package pl.coderslab.delivery;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.cars.Car;
import pl.coderslab.users.User;
import pl.coderslab.vendingMachine.Vending;

import java.util.List;

@Repository
public interface VendingDeliveryRepository extends JpaRepository<VendingDelivery, Long> {

    @Query("SELECT v FROM VendingDelivery v WHERE v.user =?1 order by v.data desc ")
    List<VendingDelivery> findAllVendingDeliveryForUser(User user);

    @Query("SELECT v FROM VendingDelivery v order by v.data desc ")
    List<VendingDelivery> findAllVendingDelivery();

    @Query("SELECT v FROM VendingDelivery v WHERE v.car =?1 order by v.data desc ")
    List<VendingDelivery> findAllVendingDeliveryForCar(Car car);

    @Query("SELECT v FROM VendingDelivery v WHERE v.vending =?1 order by v.data desc ")
    List<VendingDelivery> findAllVendingDeliveryForVending(Vending vending);
}
