package com.example.gticslaboratorio420202396.Models.Repositories;

import com.example.gticslaboratorio420202396.Models.Entities.Carrito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarritoRepository extends JpaRepository<Carrito, Integer> {
}
