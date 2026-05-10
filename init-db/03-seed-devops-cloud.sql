-- Ensure the unique constraint exists
ALTER TABLE resource_schema.resources ADD CONSTRAINT unique_resource_url UNIQUE (url);

-- Seed DevOps & Cloud Curriculum
INSERT INTO resource_schema.resources (title, description, category, content_type, url, provider) VALUES
-- MODULE 1: LINUX
('Linux Journey', 'Visual, bite-sized Linux lessons for complete beginners.', 'DevOps & Cloud', 'BLOG', 'https://linuxjourney.com/', 'LinuxJourney'),
('The Linux Command Line (Book)', 'Comprehensive guide from shell basics to bash scripting.', 'DevOps & Cloud', 'BLOG', 'https://linuxcommand.org/tlcl.php', 'William Shotts'),
('Linux Crash Course', 'Bite-sized video introduction to the Linux terminal.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=tz2NEIiVfRY', 'TechWorld with Nana'),

-- MODULE 2: GIT
('Pro Git Book', 'The official professional guide to Git internals and workflows.', 'DevOps & Cloud', 'BLOG', 'https://git-scm.com/book/en/v2', 'Git-SCM'),
('Git Branching Interactive', 'Best visual tool to practice branching and merging.', 'DevOps & Cloud', 'BLOG', 'https://learngitbranching.js.org/', 'LearnGitBranching'),
('Git Tutorial for Beginners', 'Focused video on Git basics and GitHub collaboration.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=DVRQoVRzMIY', 'TechWorld with Nana'),

-- MODULE 3 & 4: DOCKER & K8S
('Docker Concepts: The Basics', 'Official documentation on containers and images.', 'DevOps & Cloud', 'BLOG', 'https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/', 'Docker'),
('Docker Tutorial for Beginners', 'Topic-by-topic guide to containerizing applications.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=3c-iBn73dDE', 'TechWorld with Nana'),
('Kubernetes Basics', 'Interactive tutorial on K8s concepts and deployments.', 'DevOps & Cloud', 'BLOG', 'https://kubernetes.io/docs/tutorials/kubernetes-basics/', 'Kubernetes'),
('K8s Crash Course', 'High-level overview of Kubernetes orchestration.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=s_o8dwzRlu4', 'TechWorld with Nana'),

-- MODULE 5, 6 & 7: CI/CD & IaC
('GitHub Actions Quickstart', 'Automate workflows directly in your GitHub repo.', 'DevOps & Cloud', 'BLOG', 'https://docs.github.com/en/actions/writing-workflows/quickstart', 'GitHub'),
('Terraform Crash Course', 'Infrastructure as Code foundations with Terraform.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=l5k1ai_GBDE', 'TechWorld with Nana'),
('Ansible for Beginners', 'Configuration management and automation tutorial.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=1id6ERvfozo', 'TechWorld with Nana'),

-- MODULE 8 & 9: MONITORING & CLOUD
('Prometheus & Grafana', 'Monitoring and observability in the cloud.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=h4Sl21AKiDg', 'TechWorld with Nana'),
('AWS Crash Course', 'Architecting on Amazon Web Services.', 'DevOps & Cloud', 'VIDEO', 'https://www.youtube.com/watch?v=7-31KgImGgU', 'TechWorld with Nana'),
('GCP Skills Boost', 'Hands-on Google Cloud labs and documentation.', 'DevOps & Cloud', 'BLOG', 'https://cloudskillsboost.google/', 'Google Cloud')

    ON CONFLICT (url) DO UPDATE SET
    title = EXCLUDED.title,
                             description = EXCLUDED.description,
                             provider = EXCLUDED.provider;