package pl.coderslab.delivery;

import lombok.Data;
import pl.coderslab.cars.Car;
import pl.coderslab.products.Product;
import pl.coderslab.users.User;
import pl.coderslab.warehouse.Warehouse;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "delivery")
public class Delivery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String type; //dostawa lub załadunek
    @ManyToOne
    private Product product;
    private int amount;
    @ManyToOne
    private Warehouse warehouse;
    @ManyToOne
    private Car car;
    @ManyToOne
    private User user;
    private LocalDateTime data;

}