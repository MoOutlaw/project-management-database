CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    organisation_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    preferred_contact ENUM('post','email') NOT NULL
) ENGINE=InnoDB;

CREATE TABLE pool_members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    work_address TEXT NOT NULL,
    home_address TEXT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    skill_type VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(10,2) NOT NULL,
    description TEXT,
    phase ENUM('design','development','testing','deployment','complete') NOT NULL,
    client_id INT,
    FOREIGN KEY (client_id)
        REFERENCES clients(client_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE member_skills (
    member_id INT,
    skill_id INT,
    experience_level VARCHAR(50) NOT NULL,
    PRIMARY KEY (member_id, skill_id),
    FOREIGN KEY (member_id)
        REFERENCES pool_members(member_id)
        ON DELETE CASCADE,
    FOREIGN KEY (skill_id)
        REFERENCES skills(skill_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE project_skills (
    project_id INT,
    skill_id INT,
    PRIMARY KEY (project_id, skill_id),
    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE,
    FOREIGN KEY (skill_id)
        REFERENCES skills(skill_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE project_assignments (
    member_id INT PRIMARY KEY,
    project_id INT,
    FOREIGN KEY (member_id)
        REFERENCES pool_members(member_id)
        ON DELETE CASCADE,
    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;