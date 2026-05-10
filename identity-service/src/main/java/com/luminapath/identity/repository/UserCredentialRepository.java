package com.luminapath.identity.repository;

import com.luminapath.identity.model.UserCredential;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.UUID;

public interface UserCredentialRepository extends JpaRepository<UserCredential, UUID> {
    // Ensure this matches the field name 'email' in your UserCredential entity
    Optional<UserCredential> findByEmail(String email);
}