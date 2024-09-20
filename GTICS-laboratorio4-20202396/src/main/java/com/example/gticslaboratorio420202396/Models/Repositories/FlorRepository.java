package com.example.gticslaboratorio420202396.Models.Repositories;

import com.example.gticslaboratorio420202396.Models.Entities.Flor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlorRepository extends JpaRepository<Flor, Integer> {
    List<Flor> findByColor_NombreColorAndTipo_NombreTipoAndOcasion_NombreOcasion(String nombreColor, String nombreTipo, String nombreOcasion);
}
