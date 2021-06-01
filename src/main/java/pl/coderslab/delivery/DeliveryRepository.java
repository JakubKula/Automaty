package pl.coderslab.delivery;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.warehouse.Warehouse;

import java.util.List;
import java.util.Optional;

@Repository
public interface DeliveryRepository extends JpaRepository<Delivery, Long> {



    @Query("SELECT d FROM Delivery d WHERE d.warehouse =?1")
    List<Delivery> findAllDelivery(Warehouse warehouse);
}
