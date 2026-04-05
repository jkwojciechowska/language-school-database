SELECT COUNT(*) AS StudentCount FROM Student;

SELECT s.FirstName, s.LastName, c.Name AS Course
FROM Student s
         JOIN StudentGroup sg ON s.IdStudent = sg.IdStudent
         JOIN GroupTable g ON sg.IdGroup = g.IdGroup
         JOIN Course c ON g.IdCourse = c.IdCourse;

SELECT s.FirstName, s.LastName,
       COUNT(a.Present) AS TotalClasses,
       SUM(a.Present) AS Attendances
FROM Student s
         JOIN Attendance a ON s.IdStudent = a.IdStudent
GROUP BY s.IdStudent, s.FirstName, s.LastName;

SELECT t.FirstName, t.LastName, c.Name
FROM Teacher t
         JOIN GroupTable g ON t.IdTeacher = g.IdTeacher
         JOIN Course c ON g.IdCourse = c.IdCourse;

SELECT s.FirstName, s.LastName
FROM Student s
         JOIN StudentGroup sg ON s.IdStudent = sg.IdStudent
WHERE sg.IdGroup = 1;

SELECT s.FirstName, s.LastName, a.Present
FROM Attendance a
         JOIN Student s ON a.IdStudent = s.IdStudent
WHERE a.IdLesson = 1;

SELECT c.Name
FROM Course c
         JOIN Payment p ON c.IdCourse = p.IdCourse
WHERE p.IdStudent = 1;

SELECT p.Amount, p.Status, c.Name
FROM Payment p
         JOIN Course c ON p.IdCourse = c.IdCourse;

SELECT m.Name, m.Type
FROM Material m
         JOIN CourseMaterial cm ON m.IdMaterial = cm.IdMaterial
WHERE cm.IdCourse = 1;

SELECT t.FirstName, t.LastName, g.IdGroup
FROM Teacher t
         JOIN GroupTable g ON t.IdTeacher = g.IdTeacher;

SELECT s.FirstName, s.LastName
FROM Student s
         LEFT JOIN Payment p ON s.IdStudent = p.IdStudent
WHERE p.Status IS NULL OR p.Status = 'unpaid';

SELECT s.FirstName, s.LastName,
       ROUND(AVG(a.Present) * 100, 2) AS AttendancePercentage
FROM Student s
         JOIN Attendance a ON s.IdStudent = a.IdStudent
GROUP BY s.IdStudent, s.FirstName, s.LastName
ORDER BY AttendancePercentage DESC;

SELECT c.Name
FROM Course c
         LEFT JOIN CourseMaterial cm ON c.IdCourse = cm.IdCourse
WHERE cm.IdMaterial IS NULL;