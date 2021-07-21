package pl.coderslab.vendingMachine;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

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
        @NotNull(message = "Podaj ilość w cyfrach")
        private int number;
        private double cash;

        public String getAddressNumber() {
                return address + " Nr:" + number;
        }
}
