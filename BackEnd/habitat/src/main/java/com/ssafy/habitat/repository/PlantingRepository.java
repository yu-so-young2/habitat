package com.ssafy.habitat.repository;

import com.ssafy.habitat.entity.Planting;
import com.ssafy.habitat.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PlantingRepository extends JpaRepository<Planting, Integer> {
    Optional<Planting> findByUser(User user);

    Optional<Planting> findByUserAndFlowerCnt(User user, int flowerCnt);
}
