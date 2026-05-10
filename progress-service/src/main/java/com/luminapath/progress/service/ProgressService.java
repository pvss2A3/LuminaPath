package com.luminapath.progress.service;

import com.luminapath.progress.model.UserProgress;
import com.luminapath.progress.repository.ProgressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProgressService {

    private final ProgressRepository repository;

    public UserProgress markAsCompleted(UserProgress progress) {
        return repository.save(progress);
    }

    public List<UserProgress> getProgressByUserId(UUID userId) {
        return repository.findByUserId(userId);
    }
}