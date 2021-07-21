package pl.coderslab.delivery;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.cars.Car;
import pl.coderslab.users.User;
import pl.coderslab.warehouse.Warehouse;

import java.util.List;

@Repository
public interface DeliveryRepository extends JpaRepository<Delivery, Long> {

    @Query("SELECT d FROM Delivery d WHERE d.user =?1 order by d.data desc")
    List<Delivery> findAllDeliveryForUser(User user);

    @Query("SELECT d FROM Delivery d  order by d.data desc")
    List<Delivery> findAllDelivery();

    @Query("SELECT d FROM Delivery d WHERE d.warehouse =?1 order by d.data desc")
    List<Delivery> findAllDeliveryForWarehouse(Warehouse warehouse);

    @Query("SELECT d FROM Delivery d WHERE d.car =?1 order by d.data desc")
    List<Delivery> findAllDeliveryForCar(Car car);
}
