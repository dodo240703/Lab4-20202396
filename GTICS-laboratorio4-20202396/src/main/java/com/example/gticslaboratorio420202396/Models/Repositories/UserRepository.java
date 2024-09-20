package com.example.gticslaboratorio420202396.Models.Repositories;

import com.example.gticslaboratorio420202396.Models.Entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<Usuario, Integer> {
    List<Usuario> findAllByOrderByPuntuacionDesc();
}
