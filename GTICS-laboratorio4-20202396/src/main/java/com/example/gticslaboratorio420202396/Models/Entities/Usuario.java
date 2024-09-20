package com.example.gticslaboratorio420202396.Models.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idusuario", nullable = false)
    private Integer idUsuario;

    @Column(name = "nickname", nullable = false)
    private String nickname;

    @Column(name = "puntuacion")
    private Double puntuacion;

}
