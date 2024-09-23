package com.example.gticslaboratorio420202396.Controllers;

import com.example.gticslaboratorio420202396.Models.Entities.Carrito;
import com.example.gticslaboratorio420202396.Models.Entities.Flor;
import com.example.gticslaboratorio420202396.Models.Entities.Usuario;
import com.example.gticslaboratorio420202396.Models.Repositories.CarritoRepository;
import com.example.gticslaboratorio420202396.Models.Repositories.FlorRepository;
import com.example.gticslaboratorio420202396.Models.Repositories.UserRepository;
import org.springframework.data.repository.support.Repositories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/flores")
public class florController {

    final FlorRepository florRepository;
    final UserRepository userRepository;
    final CarritoRepository carritoRepository;

    public florController(FlorRepository florRepository, UserRepository userRepository, CarritoRepository carritoRepository) {
        this.florRepository = florRepository;
        this.userRepository = userRepository;
        this.carritoRepository = carritoRepository;
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
    public String showCarrito(Model model) {
        List<Carrito> listaProductos = carritoRepository.findAll();

        // Verificar si el carrito está vacío
        boolean isCarritoVacio = carritoRepository.count() == 0;
        if (isCarritoVacio) {
            // Si está vacío, añade un mensaje al modelo
            model.addAttribute("mensaje", "No existen items en su carrito");
        }
        model.addAttribute("listaProductos", listaProductos);


        return "carritoPage";
    }

    @PostMapping("/procesarPago")
    public String compraFlor(@RequestParam("idCarrito") int id, RedirectAttributes attr){
        carritoRepository.deleteById(id);

        attr.addFlashAttribute("compraMsg","Su compra se ha realizado de forma correcta, se le enviará la orden de compra a su correo.");

        return "redirect:/flores/Carrito";
    }

    @PostMapping("/procesarPagoDesdeCatalogo")
    public String compraFlorDesdeCatalogo(RedirectAttributes attr){
        attr.addFlashAttribute("compraMsg","Su compra se ha realizado de forma correcta, se le enviará la orden de compra a su correo.");

        return "redirect:/flores/Catalogo";
    }

    @PostMapping("/procesarCompraTotal")
    public String compraTotal(RedirectAttributes attr) {
        carritoRepository.deleteAll(); // Elimina todos los productos del carrito

        attr.addFlashAttribute("compraMsg", "Se realizó correctamente el pago de todos los productos de su carrito, revise su correo para ver la orden de compra.");
        return "redirect:/flores/Carrito";
    }

    @GetMapping("/agregar")
    public String florAgregar(Model model,@RequestParam("id") int id, RedirectAttributes attr) {
        Flor flor = florRepository.findById(id).orElse(null);
        if (flor != null) {
            // Crear un nuevo carrito y agregar la flor
            Carrito nuevoCarrito = new Carrito();
            nuevoCarrito.setIdFlor(flor.getIdFlor());
            nuevoCarrito.setNombre(flor.getNombre());
            nuevoCarrito.setPrecio(flor.getPrecio());
            nuevoCarrito.setCantidad(1);
            carritoRepository.save(nuevoCarrito);
        }
        return "redirect:/flores/Carrito";
    }
    @GetMapping("/quitar")
    public String florQuitar(Model model, @RequestParam("id") int id, RedirectAttributes attr) {
        // Buscar el carrito por ID
        Optional<Carrito> carritoOptional = carritoRepository.findById(id);

        if (carritoOptional.isPresent()) {
            // Si el carrito con la flor existe, eliminarlo
            carritoRepository.deleteById(id);
            attr.addFlashAttribute("msg", "Flor eliminada del carrito correctamente.");
        } else {
            attr.addFlashAttribute("error", "El elemento no existe en el carrito.");
        }
        return "redirect:/flores/Carrito";
    }



}
