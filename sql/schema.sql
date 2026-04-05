PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS StudentGroup;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS CourseMaterial;
DROP TABLE IF EXISTS Lesson;
DROP TABLE IF EXISTS GroupTable;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Teacher;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Material;
DROP TABLE IF EXISTS Room;

PRAGMA foreign_keys = ON;

CREATE TABLE Student (
                         IdStudent INTEGER PRIMARY KEY,
                         FirstName VARCHAR(20) NOT NULL,
                         LastName VARCHAR(20) NOT NULL,
                         BirthDate DATE,
                         Email VARCHAR(50) UNIQUE
);

CREATE TABLE Teacher (
                         IdTeacher INTEGER PRIMARY KEY,
                         FirstName VARCHAR(20) NOT NULL,
                         LastName VARCHAR(20) NOT NULL,
                         Specialization VARCHAR(30),
                         Experience INT,
                         HireDate DATE,
                         FireDate DATE,
                         SupervisorId INT,
                         FOREIGN KEY (SupervisorId) REFERENCES Teacher(IdTeacher) ON DELETE SET NULL
);

CREATE TABLE Course (
                        IdCourse INTEGER PRIMARY KEY,
                        Name VARCHAR(50) NOT NULL,
                        Level VARCHAR(20),
                        Language VARCHAR(20)
);

CREATE TABLE Room (
                      IdRoom INTEGER PRIMARY KEY,
                      Number INT,
                      Capacity INT
);

CREATE TABLE Material (
                          IdMaterial INTEGER PRIMARY KEY,
                          Name VARCHAR(50),
                          Type VARCHAR(20),
                          Level VARCHAR(20)
);

CREATE TABLE GroupTable (
                            IdGroup INTEGER PRIMARY KEY,
                            IdCourse INT NOT NULL,
                            IdTeacher INT NOT NULL,
                            IdRoom INT NOT NULL,
                            FOREIGN KEY (IdCourse) REFERENCES Course(IdCourse),
                            FOREIGN KEY (IdTeacher) REFERENCES Teacher(IdTeacher),
                            FOREIGN KEY (IdRoom) REFERENCES Room(IdRoom)
);

CREATE TABLE StudentGroup (
                              IdStudent INT,
                              IdGroup INT,
                              PRIMARY KEY (IdStudent, IdGroup),
                              FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent) ON DELETE CASCADE,
                              FOREIGN KEY (IdGroup) REFERENCES GroupTable(IdGroup) ON DELETE CASCADE
);

CREATE TABLE Lesson (
                        IdLesson INTEGER PRIMARY KEY,
                        IdGroup INT NOT NULL,
                        Date DATE,
                        FOREIGN KEY (IdGroup) REFERENCES GroupTable(IdGroup) ON DELETE CASCADE
);

CREATE TABLE Attendance (
                            IdStudent INT,
                            IdLesson INT,
                            Present BOOLEAN,
                            PRIMARY KEY (IdStudent, IdLesson),
                            FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent) ON DELETE CASCADE,
                            FOREIGN KEY (IdLesson) REFERENCES Lesson(IdLesson) ON DELETE CASCADE
);

CREATE TABLE CourseMaterial (
                                IdCourse INT,
                                IdMaterial INT,
                                PRIMARY KEY (IdCourse, IdMaterial),
                                FOREIGN KEY (IdCourse) REFERENCES Course(IdCourse),
                                FOREIGN KEY (IdMaterial) REFERENCES Material(IdMaterial)
);

CREATE TABLE Payment (
                         IdPayment INTEGER PRIMARY KEY,
                         IdStudent INT,
                         IdCourse INT,
                         Amount DECIMAL(10,2),
                         Date DATE,
                         Status VARCHAR(20),
                         FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent),
                         FOREIGN KEY (IdCourse) REFERENCES Course(IdCourse)
);