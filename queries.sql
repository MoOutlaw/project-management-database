INSERT INTO skills (skill_name, skill_type) VALUES
('Java', 'Backend'),
('Python', 'Backend'),
('JavaScript', 'Frontend'),
('MySQL', 'Database'),
('UI Design', 'Design'),
('Software Testing', 'Testing');


INSERT INTO pool_members 
(first_name, last_name, email, phone, work_address, home_address)
VALUES
('John', 'Smith', 'john.smith@email.com', '07111111111', 'Company HQ', 'London'),
('Sarah', 'Brown', 'sarah.brown@email.com', '07222222222', 'Company HQ', 'Manchester');


INSERT INTO member_skills VALUES
(1, 1, 'Expert'),
(1, 3, 'Intermediate'),
(2, 2, 'Junior'),
(2, 4, 'Expert');


INSERT INTO clients
(organisation_name, first_name, last_name, email, address, preferred_contact)
VALUES
('TechCorp Ltd', 'Alice', 'Green', 'alice@techcorp.com', 'London', 'email'),
('Innovate Solutions', 'Mark', 'White', 'mark@innovate.com', 'Birmingham', 'post');


INSERT INTO projects
(title, start_date, end_date, budget, description, phase, client_id)
VALUES
('Inventory System', '2026-01-10', '2026-06-10', 50000.00,
 'Custom inventory system for retail business',
 'development', 1);


INSERT INTO project_skills VALUES
(1, 1),
(1, 4);


INSERT INTO project_assignments VALUES
(1, 1);

SELECT pm.first_name, pm.last_name, s.skill_name
FROM pool_members pm
JOIN member_skills ms ON pm.member_id = ms.member_id
JOIN project_skills ps ON ms.skill_id = ps.skill_id
JOIN skills s ON s.skill_id = ms.skill_id
WHERE ps.project_id = 1;

SELECT p.title, c.organisation_name, p.phase
FROM projects p
JOIN clients c ON p.client_id = c.client_id;

SELECT pm.first_name, pm.last_name
FROM pool_members pm
LEFT JOIN project_assignments pa 
ON pm.member_id = pa.member_id
WHERE pa.project_id IS NULL;