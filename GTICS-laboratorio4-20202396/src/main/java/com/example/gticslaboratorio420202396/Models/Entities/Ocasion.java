package com.example.gticslaboratorio420202396.Models.Entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "ocasion")
public class Ocasion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idocasion",nullable = false)
    private Integer idOcasion;

    @Column(name = "ocasion",nullable = false)
    private String nombreOcasion;
}
