package com.luminapath.resource.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.UUID;

@Entity
@Table(name = "resources", schema = "resource_schema")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Resource {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(nullable = false)
    private String title;

    private String description;

    @Column(nullable = false)
    private String category;

    @Column(name = "content_type", nullable = false)
    private String contentType; // VIDEO or BLOG

    @Column(nullable = false)
    private String url;

    @Column(name = "embed_id")
    private String embedId;

    private String provider;
}