package pl.coderslab.products;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Data
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @NotNull(message = "Podaj ilość w cyfrach")
    private int packSize;
    private String type;
    private String description;
    @NotNull(message = "Podaj ilość w cyfrach")
    private int weight;

    public String getFullName() {
        return name  + " " + type + " " + packSize;
    }
}
