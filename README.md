# Language School Database (SQLite)

Relational database project for managing a language school.

## Features
- Manage students, teachers, courses, groups, and classrooms
- Track attendance and payments
- Assign students to groups
- Link courses with learning materials

## Database Structure
Main tables:
- `Student`
- `Teacher`
- `Course`
- `Group`
- `Lesson`
- `Attendance`
- `Payment`
- `Material`
- `CourseMaterial`

## Files
- `schema.sql` - database structure (tables + relations)
- `data.sql` - sample data
- `queries.sql` - example queries

## How to run
Run files in this order:
1. `schema.sql`
2. `data.sql`
3. `queries.sql`

## Example queries
- List all students in courses
- Calculate attendance percentage
- Show unpaid students
- List course materials

## Notes
- Uses SQLite
- Foreign keys enabled
- Includes relational integrity rules

## Author
Julia Wojciechowska