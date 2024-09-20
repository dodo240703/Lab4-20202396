package com.example.gticslaboratorio420202396.Models.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "color")
public class Color {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column (name = "idcolor",nullable = false)
    private Integer idColor;

    @Column(name = "nombrecolor",nullable = false)
    private String nombreColor;
}
