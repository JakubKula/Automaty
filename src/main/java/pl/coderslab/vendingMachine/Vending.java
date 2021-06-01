package pl.coderslab.vendingMachine;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "vending")
public class Vending {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        private String mark;
        private String model;
        private String address;
        private int number;
}
