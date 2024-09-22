package com.example.gticslaboratorio420202396.Models.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "carrito")
public class Carrito {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idcarrito")
    private Integer idCarrito;


    @Column(name = "idflor")
    private Integer idFlor;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "precio")
    private Double precio;

    @Column(name = "cantidad")
    private Integer cantidad;

    @Column(name = "imagen")
    private String imagen;

    @Column(name = "color")
    private String color;

    @Column(name = "tipo")
    private String tipo;

    @Column(name = "ocasion")
    private String ocasion;

    @Column(name = "sessionid")
    private String sessionId;

}
