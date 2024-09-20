package com.example.gticslaboratorio420202396.Models.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tipo")
public class Tipo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idtipo", nullable = false)
    private Integer idTipo;

    @Column(name = "nombretipo")
    private String nombreTipo;
}
