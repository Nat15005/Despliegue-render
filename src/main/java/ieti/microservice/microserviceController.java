package ieti.microservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class microserviceController {
    @GetMapping("/nombre")
    public String obtenerNombre() {
        return "Natalia Rojas";
    }
}