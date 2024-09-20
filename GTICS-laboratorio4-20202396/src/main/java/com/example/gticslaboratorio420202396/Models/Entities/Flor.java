package com.example.gticslaboratorio420202396.Models.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import javax.print.attribute.standard.MediaSize;

@Getter
@Setter
@Entity
@Table (name="flor")
public class Flor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idflor",nullable = false)
    private Integer idFlor;

    @Column(name = "nombre",nullable = false)
    private String nombre;

    @Column(name = "imagen")
    private String imagenURL;

    @Column(name = "precio",nullable = false)
    private Double precio;

    @Column(name = "descripcion")
    private String descripcion;

    //HAGAMOS JOINS
    @ManyToOne
    @JoinColumn(name = "tipo_idtipo")
    private Tipo tipo;

    @ManyToOne
    @JoinColumn(name = "color_idcolor")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "ocasion_idocasion")
    private Ocasion ocasion;

}
