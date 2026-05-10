-- PYTHON, ML & AI
INSERT INTO
    resource_schema.resources (title, description, category, content_type, url, embed_id, provider)
VALUES
    ('Python for Beginners', 'Complete Python 3 programming guide.', 'Python & AI', 'VIDEO', 'https://youtu.be/QXeEoD0pBdo', 'QXeEoD0pBdo', 'Telusko'),
    ('Machine Learning Roadmap', 'The mathematical and practical path to ML.', 'Python & AI', 'VIDEO', 'https://youtu.be/GwIo3gDZCVQ', 'GwIo3gDZCVQ', 'FreeCodeCamp'),
    ('Deep Learning & Neural Networks', 'Understanding the brains behind AI.', 'Python & AI', 'VIDEO', 'https://youtu.be/aircAruvnKk', 'aircAruvnKk', '3Blue1Brown')
ON CONFLICT (embed_id) DO NOTHING;
