package pl.coderslab.prices;

import lombok.Data;
import pl.coderslab.products.Product;
import pl.coderslab.vendingMachine.Vending;

import javax.persistence.*;

@Entity
@Data
@Table(name = "prices")
public class Price {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Product product;
    @ManyToOne
    private Vending vending;
    private Float price;


}
