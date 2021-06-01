package pl.coderslab.cars;

import org.springframework.stereotype.Service;

@Service
public class CarService {

    private final CarRepository carRepository;

    public CarService(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    public void updateCar(Car car){
        carRepository.save(car);
    }
}
