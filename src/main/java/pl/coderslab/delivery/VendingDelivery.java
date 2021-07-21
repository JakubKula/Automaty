package pl.coderslab.delivery;

import lombok.Data;
import pl.coderslab.cars.Car;
import pl.coderslab.products.Product;
import pl.coderslab.users.User;
import pl.coderslab.vendingMachine.Vending;
import pl.coderslab.warehouse.Warehouse;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "vendingDelivery")
public class VendingDelivery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String type;
    @ManyToOne
    private Product product;
    private int amount;
    @ManyToOne
    private Car car;
    @ManyToOne
    private User user;
    @ManyToOne
    private Vending vending;
    private LocalDateTime data;
}
