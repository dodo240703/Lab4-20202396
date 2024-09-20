package com.example.gticslaboratorio420202396.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/flores")
public class florController {

    @GetMapping("/Catalogo")
    public String showCatalogo() {
        return "catalogoPage";
    }
    @GetMapping("/Entretenimiento")
    public String showEntretenimiento() {
        return "entretenimientoPage";
    }
    @GetMapping("/Carrito")
    public String showCarrito() {
        return "carritoPage";
    }
}
