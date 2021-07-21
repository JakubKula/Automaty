package pl.coderslab.quantity;

import lombok.Data;
import pl.coderslab.cars.Car;
import pl.coderslab.products.Product;
import pl.coderslab.vendingMachine.Vending;
import pl.coderslab.warehouse.Warehouse;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "quantity")
public class Quantity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Product product;
    @NotNull(message = "Podaj ilość w cyfrach")
    private int quantity;
    @ManyToOne
    private Warehouse warehouse;
    @ManyToOne
    private Car car;
    @ManyToOne
    private Vending vending;
    private LocalDateTime data;
}
