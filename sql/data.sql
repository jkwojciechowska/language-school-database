INSERT INTO Student (IdStudent, FirstName, LastName, BirthDate, Email) VALUES (1, 'Tomasz', 'Zieliński', '2008-05-15', 't.zielinski@mail.com');
INSERT INTO Student (IdStudent, FirstName, LastName, BirthDate, Email) VALUES (2, 'Adam', 'Nowak', '2007-01-25', 'a.nowak@mail.com');
INSERT INTO Student (IdStudent, FirstName, LastName, BirthDate, Email) VALUES (3, 'Anna', 'Kowalska', '2007-08-30', 'a.kowalska@mail.com');
INSERT INTO Student (IdStudent, FirstName, LastName, BirthDate, Email) VALUES (4, 'Zuzanna', 'Lew', '2008-12-02', 'z.lew@mail.com');
INSERT INTO Student (IdStudent, FirstName, LastName, BirthDate, Email) VALUES (5, 'Ewelina', 'Skrzypecka', '2006-03-17', 'e.skrzypecka@mail.com');

INSERT INTO Teacher (IdTeacher, FirstName, LastName, Specialization, Experience, HireDate, FireDate, SupervisorId)
VALUES (1, 'Karolina', 'Wójcik', 'English', 5, '2024-09-01', NULL, NULL);

INSERT INTO Teacher (IdTeacher, FirstName, LastName, Specialization, Experience, HireDate, FireDate, SupervisorId) VALUES (2, 'Michał', 'Banaś', 'Spanish', 9, '2019-09-01', NULL, 1);
INSERT INTO Teacher (IdTeacher, FirstName, LastName, Specialization, Experience, HireDate, FireDate, SupervisorId) VALUES (3, 'Aleksandra', 'Wierzbicka', 'German', 2, '2024-09-01', NULL, 1);
INSERT INTO Course (IdCourse, Name, Level, Language) VALUES (1, 'English C1', 'C1', 'English');
INSERT INTO Room (IdRoom, Number, Capacity) VALUES (1, 201, 15);
INSERT INTO Material (IdMaterial, Name, Type, Level) VALUES (1, 'Grammar basics', 'presentation', 'C1');

INSERT INTO Material VALUES (2, 'Audio dialogues', 'audio', 'C1');

INSERT INTO GroupTable (IdGroup, IdCourse, IdTeacher, IdRoom) VALUES (1, 1, 1, 1);

INSERT INTO Lesson (IdLesson, IdGroup, Date) VALUES (1, 1, '2026-04-01');

INSERT INTO StudentGroup VALUES (1, 1);
INSERT INTO StudentGroup VALUES (2, 1);
INSERT INTO StudentGroup VALUES (3, 1);
INSERT INTO StudentGroup VALUES (4, 1);
INSERT INTO StudentGroup VALUES (5, 1);

INSERT INTO Attendance VALUES (1, 1, 1);
INSERT INTO Attendance VALUES (2, 1, 0);
INSERT INTO Attendance VALUES (3, 1, 1);
INSERT INTO Attendance VALUES (4, 1, 1);
INSERT INTO Attendance VALUES (5, 1, 0);

INSERT INTO CourseMaterial VALUES (1, 1);
INSERT INTO CourseMaterial VALUES (1, 2);

INSERT INTO Payment VALUES (1, 1, 1, 500, '2026-04-01', 'paid');
INSERT INTO Payment VALUES (2, 2, 1, 500, '2026-04-01', 'unpaid');