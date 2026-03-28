# 🗄️ IT Project Management Database

A relational database system designed to manage IT projects, clients, staff pool members, skills, and project assignments. Built using MySQL as part of my first-year BSc Computer Science degree at Aston University.

## 🛠 Tech Stack
- **MySQL** (InnoDB engine)
- **SQL** — DDL (schema), DML (inserts), DQL (queries)

## 🗂️ Database Schema

The database consists of 7 normalised tables:

| Table | Description |
|---|---|
| `clients` | Client organisations commissioning projects |
| `pool_members` | Available staff/contractors |
| `skills` | Skill catalogue (Backend, Frontend, DB, Design, Testing) |
| `projects` | Active and completed projects with phases and budgets |
| `member_skills` | Many-to-many: members ↔ skills with experience level |
| `project_skills` | Many-to-many: projects ↔ required skills |
| `project_assignments` | Which member is assigned to which project |

## 📋 Key Features
- Fully normalised relational schema with foreign keys and cascading rules
- ENUM fields for controlled values (project phases, preferred contact)
- Skill-based member-to-project matching via JOIN queries
- Sample data included for testing and demonstration

## 🔍 Queries Included (`queries.sql`)
- Find members whose skills match a specific project's requirements
- List all projects with their client organisation and current phase
- Identify unassigned pool members (LEFT JOIN with NULL check)

## 🚀 How to Run
1. Ensure MySQL is installed and running.
2. Create a new database:
```sql
   CREATE DATABASE project_management;
   USE project_management;
```
3. Import the schema:
```bash
   mysql -u root -p project_management < schema.sql
```
4. Populate and run queries:
```bash
   mysql -u root -p project_management < queries.sql
```

## 🎓 Context
**Module:** DG1FDS — Internet Application and Databases  
**Institution:** Aston University  
**Year:** 1st Year BSc Computer Science
