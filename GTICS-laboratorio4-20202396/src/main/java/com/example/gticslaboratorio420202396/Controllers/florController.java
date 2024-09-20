package com.example.gticslaboratorio420202396.Controllers;

import com.example.gticslaboratorio420202396.Models.Entities.Flor;
import com.example.gticslaboratorio420202396.Models.Repositories.FlorRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/flores")
public class florController {

    final FlorRepository florRepository;

    public florController(FlorRepository florRepository) {
        this.florRepository = florRepository;
    }

    @GetMapping("/Catalogo")
    public String showCatalogo(@RequestParam(required = false) String color,
                               @RequestParam(required = false) String tipo,
                               @RequestParam(required = false) String ocasion,
                               Model model) {
        List<Flor> listaFlowers;
        // Si se aplican filtros, busca con base en esos filtros
        if (color != null && tipo != null && ocasion != null) {
            listaFlowers = florRepository.findByColor_NombreColorAndTipo_NombreTipoAndOcasion_NombreOcasion(color, tipo, ocasion);
        } else {
            listaFlowers = florRepository.findAll();
        }
        model.addAttribute("listaFlowers", listaFlowers);
        model.addAttribute("totalFlores", listaFlowers.size());
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
