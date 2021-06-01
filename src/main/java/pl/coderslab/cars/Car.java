package pl.coderslab.cars;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "cars")
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String mark;
    private String model;
    private String registration;

    public String getMarkRegi() {
        return mark + " " + registration;
    }
}
