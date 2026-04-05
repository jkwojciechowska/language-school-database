CREATE TABLE Kursant (
                         IdKursant INT PRIMARY KEY,
                         Imie VARCHAR(20) NOT NULL,
                         Nazwisko VARCHAR(20) NOT NULL,
                         DataUrodzenia DATE,
                         Email VARCHAR(50) UNIQUE
);

CREATE TABLE Lektor (
                        IdLektor INT PRIMARY KEY,
                        Imie VARCHAR(20) NOT NULL,
                        Nazwisko VARCHAR(20) NOT NULL,
                        Specjalizacja VARCHAR(30),
                        Doswiadczenie INT,
                        DataZatrudnienia DATE,
                        DataZwolnienia DATE,
                        IdPrzelozony INT,
                        FOREIGN KEY (IdPrzelozony) REFERENCES Lektor(IdLektor)
);

CREATE TABLE Kurs (
                      IdKurs INT PRIMARY KEY,
                      Nazwa VARCHAR(50) NOT NULL,
                      Poziom VARCHAR(20),
                      Jezyk VARCHAR(20)
);

CREATE TABLE Sala (
                      IdSala INT PRIMARY KEY,
                      Numer INT,
                      MaxKursantow INT
);

CREATE TABLE Grupa (
                       IdGrupa INT PRIMARY KEY,
                       IdKurs INT,
                       IdLektor INT,
                       IdSala INT,
                       FOREIGN KEY (IdKurs) REFERENCES Kurs(IdKurs),
                       FOREIGN KEY (IdLektor) REFERENCES Lektor(IdLektor),
                       FOREIGN KEY (IdSala) REFERENCES Sala(IdSala)
);

CREATE TABLE KursantGrupa (
                              IdKursant INT,
                              IdGrupa INT,
                              PRIMARY KEY (IdKursant, IdGrupa),
                              FOREIGN KEY (IdKursant) REFERENCES Kursant(IdKursant),
                              FOREIGN KEY (IdGrupa) REFERENCES Grupa(IdGrupa)
);

CREATE TABLE Zajecia (
                         IdZajecia INT PRIMARY KEY,
                         IdGrupa INT,
                         Data DATE,
                         FOREIGN KEY (IdGrupa) REFERENCES Grupa(IdGrupa)
);

CREATE TABLE Obecnosc (
                          IdKursant INT,
                          IdZajecia INT,
                          Obecny BOOLEAN,
                          PRIMARY KEY (IdKursant, IdZajecia),
                          FOREIGN KEY (IdKursant) REFERENCES Kursant(IdKursant),
                          FOREIGN KEY (IdZajecia) REFERENCES Zajecia(IdZajecia)
);

CREATE TABLE Material (
                          IdMaterial INT PRIMARY KEY,
                          Nazwa VARCHAR(50),
                          Typ VARCHAR(20),
                          Poziom VARCHAR(20)
);

CREATE TABLE KursMaterial (
                              IdKurs INT,
                              IdMaterial INT,
                              PRIMARY KEY (IdKurs, IdMaterial),
                              FOREIGN KEY (IdKurs) REFERENCES Kurs(IdKurs),
                              FOREIGN KEY (IdMaterial) REFERENCES Material(IdMaterial)
);

CREATE TABLE Platnosc (
                          IdPlatnosc INT PRIMARY KEY,
                          IdKursant INT,
                          IdKurs INT,
                          Kwota DECIMAL(10,2),
                          Data DATE,
                          Status VARCHAR(20),
                          FOREIGN KEY (IdKursant) REFERENCES Kursant(IdKursant),
                          FOREIGN KEY (IdKurs) REFERENCES Kurs(IdKurs)
);