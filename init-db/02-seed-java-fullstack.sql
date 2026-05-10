-- Ensure the unique constraint exists
ALTER TABLE resource_schema.resources ADD CONSTRAINT unique_resource_url UNIQUE (url);

-- Seed Java Curriculum
INSERT INTO resource_schema.resources (title, description, category, content_type, url, provider) VALUES
-- PHASE 1: FOUNDATIONS
('Telusko: Java for Beginners', 'Core Java basics: Variables, Loops, and OOP Pillars.', 'Java Full Stack', 'VIDEO', 'https://www.youtube.com/playlist?list=PLsyeobzWxl7pe_IiTfNyr55kwJPWbgxB5', 'Telusko'),
('Think Java (2nd Ed.)', 'Foundational book covering variables to inheritance.', 'Java Full Stack', 'BLOG', 'https://greenteapress.com/thinkjava7/html/index.html', 'Green Tea Press'),
('Oracle Official Java Tutorials', 'The official language documentation and trails.', 'Java Full Stack', 'BLOG', 'https://docs.oracle.com/javase/tutorial/', 'Oracle'),

-- PHASE 2: INTERMEDIATE & DSA
('Java Brains Fundamentals', 'Deep structured series bridging core Java & frameworks.', 'Java Full Stack', 'VIDEO', 'https://www.youtube.com/@Java.Brains/playlists', 'Java Brains'),
('Intro to Programming (David Eck)', 'Comprehensive Java 17 guide used by colleges.', 'Java Full Stack', 'BLOG', 'https://math.hws.edu/javanotes/', 'David Eck'),
('Think Data Structures', 'DSA in Java: Learn by building a search engine.', 'Java Full Stack', 'BLOG', 'https://greenteapress.com/thinkdast/html/index.html', 'Allen Downey'),

-- PHASE 3: FRAMEWORKS & BACKEND
('Amigoscode: Spring Boot', 'Focused, practical Spring Boot & JPA tutorials.', 'Java Full Stack', 'VIDEO', 'https://www.youtube.com/@amigoscode/playlists', 'Amigoscode'),
('Baeldung: Java & Spring', 'High-quality technical articles for backend devs.', 'Java Full Stack', 'BLOG', 'https://www.baeldung.com/java-tutorial', 'Baeldung'),
('Spring Official Guides', 'Hands-on 15-30 min guides from the Spring team.', 'Java Full Stack', 'BLOG', 'https://spring.io/guides', 'Spring.io'),

-- PHASE 4: INTERVIEW & PRACTICE
('LeetCode Practice', 'DSA problem solving and interview preparation.', 'Java Full Stack', 'BLOG', 'https://leetcode.com/problemset/', 'LeetCode'),
('CodeGym: Interactive Tasks', '1200+ Java tasks with instant feedback.', 'Java Full Stack', 'BLOG', 'https://codegym.cc/', 'CodeGym'),
('Javarevisited', 'Interview prep, roadmaps, and concept articles.', 'Java Full Stack', 'BLOG', 'https://javarevisited.blogspot.com/', 'Javarevisited')

    ON CONFLICT (url) DO UPDATE SET
    title = EXCLUDED.title,
                             description = EXCLUDED.description,
                             provider = EXCLUDED.provider;