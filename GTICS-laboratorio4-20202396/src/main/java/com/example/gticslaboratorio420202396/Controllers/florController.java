package com.example.gticslaboratorio420202396.Controllers;

import com.example.gticslaboratorio420202396.Models.Entities.Flor;
import com.example.gticslaboratorio420202396.Models.Entities.Usuario;
import com.example.gticslaboratorio420202396.Models.Repositories.FlorRepository;
import com.example.gticslaboratorio420202396.Models.Repositories.UserRepository;
import org.springframework.data.repository.support.Repositories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/flores")
public class florController {

    final FlorRepository florRepository;
    final UserRepository userRepository;

    public florController(FlorRepository florRepository, UserRepository userRepository) {
        this.florRepository = florRepository;
        this.userRepository = userRepository;
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
    public String showEntretenimiento(Model model) {
        List<Flor> listaFlowers = florRepository.findAll();
        List<Usuario> listaUsuarios = userRepository.findAllByOrderByPuntuacionDesc();


        // Duplica y mezcla las flores para tener pares
        List<Flor> cartas = new ArrayList<>(listaFlowers);
        cartas.addAll(listaFlowers); // Duplicar para los pares
        Collections.shuffle(cartas); // Mezclar las cartas

        model.addAttribute("listaUsuarios", listaUsuarios);
        model.addAttribute("listaFlowers", cartas);
        return "entretenimientoPage";
    }
    @PostMapping("/Entretenimiento")
    public String submitUserScore(Model model, Usuario usuario) {
        // Guardar el usuario con el nickname y puntuación
        userRepository.save(usuario);

        // Redirigir a la misma página para mostrar la lista actualizada
        return "redirect:/flores/Entretenimiento";
    }

    @GetMapping("/Carrito")
    public String showCarrito() {
        return "carritoPage";
    }
}
