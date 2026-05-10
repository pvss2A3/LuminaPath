package com.luminapath.resource.service;

import com.luminapath.resource.model.Resource;
import com.luminapath.resource.repository.ResourceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ResourceService {

    private final ResourceRepository repository;

    public List<Resource> getAllResources() {
        return repository.findAll();
    }

    public List<Resource> getResourcesByCategory(String category) {
        return repository.findByCategoryIgnoreCase(category);
    }

    public Resource addResource(Resource resource) {
        return repository.save(resource);
    }
}