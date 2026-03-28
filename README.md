# IT Project Management Database

A relational database system designed to manage IT projects, clients, staff pool members, skills, and project assignments. Built using MySQL as part of the Internet Applications and Databases module during my first year of BSc Computer Science at Aston University.

The system models a realistic IT staffing and project management workflow, where clients commission projects, staff members are matched to projects based on their skills, and assignments are tracked throughout the project lifecycle.

---

## Module Context

**Module:** Internet Applications and Databases
**Institution:** Aston University
**Year:** 1st Year, BSc Computer Science

---

## Tech Stack

**Database:** MySQL (InnoDB engine)
**Language:** SQL
- DDL — schema definition and table structure
- DML — data insertion and manipulation
- DQL — querying and reporting

---

## Database Schema

The database consists of 7 fully normalised tables:

| Table | Description |
|---|---|
| `clients` | Client organisations commissioning projects |
| `pool_members` | Available staff and contractors |
| `skills` | Skill catalogue covering Backend, Frontend, Database, Design, and Testing |
| `projects` | Active and completed projects, including phases and budgets |
| `member_skills` | Many-to-many relationship between members and skills, with experience level |
| `project_skills` | Many-to-many relationship between projects and their required skills |
| `project_assignments` | Records of which member is assigned to which project |

---

## Key Features

- Fully normalised relational schema with defined foreign keys and cascading rules to maintain referential integrity
- ENUM fields used for controlled values such as project phases and preferred contact methods, preventing invalid data entry
- Skill-based member-to-project matching using multi-table JOIN queries
- Sample data included across all tables for testing and demonstration purposes

---

## Queries Included

All queries are contained in `queries.sql`. The following scenarios are covered:

- Retrieve all pool members whose skills match the requirements of a specific project
- List all projects alongside their client organisation and current phase
- Identify pool members who have not yet been assigned to any project, using a LEFT JOIN with a NULL check

---

## How to Run

**Prerequisites:** MySQL installed and running on your machine.

**Step 1 — Create the database**

```sql
CREATE DATABASE project_management;
USE project_management;
```

**Step 2 — Import the schema**

```bash
mysql -u root -p project_management < schema.sql
```

**Step 3 — Load sample data and run queries**

```bash
mysql -u root -p project_management < queries.sql
```

You can also open the `.sql` files directly in MySQL Workbench or any SQL client of your choice and execute them manually.

---

## Repository Structure

```
├── schema.sql        # Table definitions, constraints, and foreign keys
├── queries.sql       # Sample data inserts and demonstration queries
└── README.md
```
