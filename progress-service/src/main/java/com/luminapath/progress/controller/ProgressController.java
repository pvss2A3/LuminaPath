package com.luminapath.progress.controller;

import com.luminapath.progress.model.UserProgress;
import com.luminapath.progress.service.ProgressService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/progress")
@RequiredArgsConstructor
public class ProgressController {

    private final ProgressService service;

    @PostMapping
    public ResponseEntity<UserProgress> completeResource(@RequestBody UserProgress progress) {
        return ResponseEntity.ok(service.markAsCompleted(progress));
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<UserProgress>> getUserProgress(@PathVariable UUID userId) {
        return ResponseEntity.ok(service.getProgressByUserId(userId));
    }
}