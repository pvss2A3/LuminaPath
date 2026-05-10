-- 1. Create schemas for microservice isolation
CREATE SCHEMA IF NOT EXISTS auth_schema;
CREATE SCHEMA IF NOT EXISTS resource_schema;
CREATE SCHEMA IF NOT EXISTS progress_schema;

-- 2. Resource Schema Tables
CREATE TABLE IF NOT EXISTS resource_schema.resources (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    content_type VARCHAR(10) CHECK (content_type IN ('VIDEO', 'BLOG')),
    url TEXT NOT NULL,
    embed_id VARCHAR(100),
    provider VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- 3. Auth Schema Tables (Student Registration)
CREATE TABLE IF NOT EXISTS auth_schema.users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role VARCHAR(20) DEFAULT 'STUDENT',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- 4. Progress Schema Tables (Tracking)
CREATE TABLE IF NOT EXISTS progress_schema.user_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL, -- References auth_schema.users(id) logically
    resource_id UUID NOT NULL, -- References resource_schema.resources(id) logically
    status VARCHAR(20) DEFAULT 'COMPLETED',
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Indexing for performance
CREATE INDEX idx_resource_category ON resource_schema.resources(category);
CREATE INDEX idx_user_email ON auth_schema.users(email);
CREATE INDEX idx_progress_user ON progress_schema.user_progress(user_id);
