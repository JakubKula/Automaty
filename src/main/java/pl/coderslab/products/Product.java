package pl.coderslab.products;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private int packSize;
    private String type;
    private String description;
    private int weight;

    public String getFullName() {

        return name  + " " + type + " " + packSize;
    }
}
