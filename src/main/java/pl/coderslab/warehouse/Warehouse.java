package pl.coderslab.warehouse;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "warehouse")
public class Warehouse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String address;
}
