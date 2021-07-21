package pl.coderslab.delivery;

import lombok.Data;
import org.springframework.format.annotation.NumberFormat;
import pl.coderslab.cars.Car;
import pl.coderslab.products.Product;
import pl.coderslab.users.User;
import pl.coderslab.warehouse.Warehouse;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "delivery")
public class Delivery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String type; //dostawa, załadunek, zniszczenie, przeterminowane, zjedzone
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

    public String getAll() {

        if(car == null){
            return type+" P:("+product.getFullName()+") ilość:("+amount+") "+warehouse.getName()+" U:("+user.getUsername()+") "+data;
        }
        if(warehouse == null){
            return type+" P:("+product.getFullName()+") ilość:("+amount+") "+car.getRegistration()+" U:("+user.getUsername()+") "+data;
        }
        else {
            return type+" P:("+product.getFullName()+") ilość:("+amount+") U:("+user.getUsername()+") "+data;
        }
    }

}