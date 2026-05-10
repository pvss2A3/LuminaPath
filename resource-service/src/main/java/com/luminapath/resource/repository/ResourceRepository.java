package com.luminapath.resource.repository;

import com.luminapath.resource.model.Resource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.UUID;

@Repository
public interface ResourceRepository extends JpaRepository<Resource, UUID> {
    // Custom finder to filter resources by category (e.g., "Java")
    List<Resource> findByCategoryIgnoreCase(String category);
}