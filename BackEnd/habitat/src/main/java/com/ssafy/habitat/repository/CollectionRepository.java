package com.ssafy.habitat.repository;

import com.ssafy.habitat.entity.Collection;
import com.ssafy.habitat.entity.Planting;
import com.ssafy.habitat.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectionRepository extends JpaRepository<Collection, Integer> {
    Long countByUser(User user);

    List<Collection> findByUser(User user);
}
