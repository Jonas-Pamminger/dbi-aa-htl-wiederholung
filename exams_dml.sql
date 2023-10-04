--------------------------------------------
-- Initialize Mockup data
--------------------------------------------
-- Fächer
INSERT INTO Subject (id, name)
VALUES (1, 'Mathematik');
INSERT INTO Subject (id, name)
VALUES (2, 'Informatik');
INSERT INTO Subject (id, name)
VALUES (3, 'Geschichte');
INSERT INTO Subject (id, name)
VALUES (4, 'Biologie');
INSERT INTO Subject (id, name)
VALUES (5, 'Chemie');
INSERT INTO Subject (id, name)
VALUES (6, 'Physik');

-- Klassen
INSERT INTO Class (id, name)
VALUES (1, '1AHIF');
INSERT INTO Class (id, name)
VALUES (2, '1BHIF');
INSERT INTO Class (id, name)
VALUES (3, '2AHIF');
INSERT INTO Class (id, name)
VALUES (4, '3AHIF');
INSERT INTO Class (id, name)
VALUES (5, '4AHIF');
INSERT INTO Class (id, name)
VALUES (6, '5AHIF');

-- Lehrer
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (1, 'Emma', 'Müller', NULL);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (2, 'Liam', 'Schmidt', NULL);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (3, 'Mia', 'Fischer', NULL);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (4, 'Noah', 'Becker', NULL);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (5, 'Sophie', 'Wagner', NULL);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (6, 'David', 'Richter', NULL);

-- Klasse 1AHIF
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (7, 'Lukas', 'Schulz', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (8, 'Sophie', 'Meier', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (9, 'Finn', 'Müller', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (10, 'Mia', 'Schmidt', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (11, 'Ben', 'Wagner', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (12, 'Hannah', 'Becker', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (13, 'Leon', 'Hoffmann', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (14, 'Lena', 'Schneider', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (15, 'Felix', 'Koch', 1);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (16, 'Emilia', 'Bauer', 1);

-- Klasse 1BHIF
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (17, 'Elias', 'Herrmann', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (18, 'Emma', 'Schulze', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (19, 'Paul', 'Lange', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (20, 'Maja', 'Hofmann', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (21, 'Luca', 'Fischer', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (22, 'Marie', 'Zimmermann', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (23, 'Oskar', 'Krüger', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (24, 'Clara', 'Vogel', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (25, 'David', 'Hahn', 2);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (26, 'Lina', 'Richter', 2);

-- Klasse 2AHIF
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (27, 'Jonas', 'Schmidt', 3);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (28, 'Laura', 'Weber', 3);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (29, 'Tim', 'Schneider', 3);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (30, 'Lea', 'Müller', 3);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (31, 'Moritz', 'Wagner', 3);

-- Klasse 3AHIF
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (32, 'Julia', 'Koch', 4);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (33, 'Simon', 'Becker', 4);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (34, 'Anna', 'Hoffmann', 4);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (35, 'Jan', 'Meyer', 4);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (36, 'Mara', 'Hartmann', 4);

-- Klasse 4AHIF
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (37, 'Maximilian', 'Bauer', 5);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (38, 'Jana', 'Hahn', 5);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (39, 'Tom', 'Kühn', 5);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (40, 'Emily', 'Friedrich', 5);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (41, 'Finn', 'Krause', 5);

-- Klasse 5AHIF
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (42, 'Sophia', 'Schulz', 6);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (43, 'Timothy', 'Werner', 6);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (44, 'Amelie', 'Herrmann', 6);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (45, 'Paula', 'Graf', 6);
INSERT INTO Person (id, firstname, lastname, class_id)
VALUES (46, 'Felix', 'Lorenz', 6);


-- Kompetenzen
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (1, 'Mathematiklehrer', 1, 1);
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (12, 'Mathematiklehrer', 6, 1);

INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (3, 'Informatiklehrer', 2, 2);
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (5, 'Informatiklehrer', 3, 2);
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (7, 'Informatiklehrer', 4, 2);

INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (4, 'Geschichtslehrer', 2, 3);
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (8, 'Geschichtslehrer', 4, 3);

INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (6, 'Biologielehrer', 3, 4);
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (9, 'Biologielehrer', 5, 4);

INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (10, 'Chemielehrer', 5, 5);
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (13, 'Chemielehrer', 6, 5);

INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (2, 'Physiklehrer', 1, 6);
INSERT INTO Competence (id, description, person_id, subject_id)
VALUES (11, 'Physiklehrer', 5, 6);

-- Raumtypen
INSERT INTO RoomType (id, room_type)
VALUES (1, 'Klassenzimmer');
INSERT INTO RoomType (id, room_type)
VALUES (2, 'EDV-Saal');

-- Räume
INSERT INTO Room (id, designation, type_id)
VALUES (1, 'Raum 101', 1);
INSERT INTO Room (id, designation, type_id)
VALUES (2, 'EDV-Saal 1', 2);
INSERT INTO Room (id, designation, type_id)
VALUES (3, 'Raum 102', 1);
INSERT INTO Room (id, designation, type_id)
VALUES (4, 'EDV-Saal 2', 2);
INSERT INTO Room (id, designation, type_id)
VALUES (5, 'Raum 103', 1);
INSERT INTO Room (id, designation, type_id)
VALUES (6, 'Raum 104', 2);

-- Rollen
INSERT INTO ExamRole (id, role)
VALUES (1, 'Schüler');
INSERT INTO ExamRole (id, role)
VALUES (2, 'Prüfer');
INSERT INTO ExamRole (id, role)
VALUES (3, 'Aufsichtsperson');


-- Examen für Klasse 1AHIF
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (1, 'Mathematik-Test-1AHIF-1', TO_TIMESTAMP('2023-09-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (2, 'Mathematik-Test-1AHIF-2', TO_TIMESTAMP('2024-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (3, 'Informatik-Test-1AHIF-1', TO_TIMESTAMP('2023-10-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (4, 'Informatik-Test-1AHIF-2', TO_TIMESTAMP('2024-01-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (5, 'Geschichte-Test-1AHIF-1', TO_TIMESTAMP('2023-11-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (6, 'Geschichte-Test-1AHIF-2', TO_TIMESTAMP('2024-02-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (7, 'Biologie-Test-1AHIF-1', TO_TIMESTAMP('2024-01-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (8, 'Biologie-Test-1AHIF-2', TO_TIMESTAMP('2024-04-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (9, 'Chemie-Test-1AHIF-1', TO_TIMESTAMP('2024-03-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (10, 'Chemie-Test-1AHIF-2', TO_TIMESTAMP('2024-06-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (11, 'Physik-Test-1AHIF-1', TO_TIMESTAMP('2024-05-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (12, 'Physik-Test-1AHIF-2', TO_TIMESTAMP('2024-06-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);

-- Examen für Klasse 1BHIF
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (13, 'Mathematik-Test-1BHIF-1', TO_TIMESTAMP('2023-09-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (14, 'Mathematik-Test-1BHIF-2', TO_TIMESTAMP('2024-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (15, 'Informatik-Test-1BHIF-1', TO_TIMESTAMP('2023-10-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (16, 'Informatik-Test-1BHIF-2', TO_TIMESTAMP('2024-01-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (17, 'Geschichte-Test-1BHIF-1', TO_TIMESTAMP('2023-11-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (18, 'Geschichte-Test-1BHIF-2', TO_TIMESTAMP('2024-02-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (19, 'Biologie-Test-1BHIF-1', TO_TIMESTAMP('2024-01-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 6);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (20, 'Biologie-Test-1BHIF-2', TO_TIMESTAMP('2024-04-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 6);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (21, 'Chemie-Test-1BHIF-1', TO_TIMESTAMP('2024-03-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (22, 'Chemie-Test-1BHIF-2', TO_TIMESTAMP('2024-06-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (23, 'Physik-Test-1BHIF-1', TO_TIMESTAMP('2024-05-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (24, 'Physik-Test-1BHIF-2', TO_TIMESTAMP('2024-06-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);

-- Examen für Klasse 2AHIF
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (25, 'Mathematik-Test-2AHIF-1', TO_TIMESTAMP('2023-10-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (26, 'Mathematik-Test-2AHIF-2', TO_TIMESTAMP('2024-01-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (27, 'Informatik-Test-2AHIF-1', TO_TIMESTAMP('2023-11-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (28, 'Informatik-Test-2AHIF-2', TO_TIMESTAMP('2024-02-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO exam (id, title, exam_date, subject_id, room_id)
VALUES (29, 'Geschichte-Test-2AHIF-1', TO_TIMESTAMP('2023-12-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (30, 'Geschichte-Test-2AHIF-2', TO_TIMESTAMP('2024-03-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (31, 'Biologie-Test-2AHIF-1', TO_TIMESTAMP('2024-01-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (32, 'Biologie-Test-2AHIF-2', TO_TIMESTAMP('2024-04-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (33, 'Chemie-Test-2AHIF-1', TO_TIMESTAMP('2024-03-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (34, 'Chemie-Test-2AHIF-2', TO_TIMESTAMP('2024-06-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (35, 'Physik-Test-2AHIF-1', TO_TIMESTAMP('2024-05-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (36, 'Physik-Test-2AHIF-2', TO_TIMESTAMP('2024-07-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);

-- Examen für Klasse 3AHIF
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (37, 'Mathematik-Test-3AHIF-1', TO_TIMESTAMP('2023-10-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (38, 'Mathematik-Test-3AHIF-2', TO_TIMESTAMP('2024-01-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (39, 'Informatik-Test-3AHIF-1', TO_TIMESTAMP('2023-11-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (40, 'Informatik-Test-3AHIF-2', TO_TIMESTAMP('2024-02-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (41, 'Geschichte-Test-3AHIF-1', TO_TIMESTAMP('2023-12-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (42, 'Geschichte-Test-3AHIF-2', TO_TIMESTAMP('2024-03-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (43, 'Biologie-Test-3AHIF-1', TO_TIMESTAMP('2024-01-30 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (44, 'Biologie-Test-3AHIF-2', TO_TIMESTAMP('2024-04-30 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (45, 'Chemie-Test-3AHIF-1', TO_TIMESTAMP('2024-03-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (46, 'Chemie-Test-3AHIF-2', TO_TIMESTAMP('2024-06-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (47, 'Physik-Test-3AHIF-1', TO_TIMESTAMP('2024-05-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (48, 'Physik-Test-3AHIF-2', TO_TIMESTAMP('2024-07-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 1);

-- Examen für Klasse 4AHIF
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (49, 'Mathematik-Test-4AHIF-1', TO_TIMESTAMP('2023-11-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (50, 'Mathematik-Test-4AHIF-2', TO_TIMESTAMP('2024-02-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (51, 'Informatik-Test-4AHIF-1', TO_TIMESTAMP('2023-11-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (52, 'Informatik-Test-4AHIF-2', TO_TIMESTAMP('2024-02-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (53, 'Geschichte-Test-4AHIF-1', TO_TIMESTAMP('2023-12-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (54, 'Geschichte-Test-4AHIF-2', TO_TIMESTAMP('2024-03-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (55, 'Biologie-Test-4AHIF-1', TO_TIMESTAMP('2024-02-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (56, 'Biologie-Test-4AHIF-2', TO_TIMESTAMP('2024-05-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (57, 'Chemie-Test-4AHIF-1', TO_TIMESTAMP('2024-03-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (58, 'Chemie-Test-4AHIF-2', TO_TIMESTAMP('2024-06-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (59, 'Physik-Test-4AHIF-1', TO_TIMESTAMP('2024-04-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (60, 'Physik-Test-4AHIF-2', TO_TIMESTAMP('2024-07-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 3);

-- Examen für Klasse 5AHIF
INSERT INTO Exam (id, title, exam_date, subject_id, room_id)
VALUES (61, 'Mathematik-Test-5AHIF-1', TO_TIMESTAMP('2023-11-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (62, 'Mathematik-Test-5AHIF-2', TO_TIMESTAMP('2024-02-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (63, 'Informatik-Test-5AHIF-1', TO_TIMESTAMP('2023-11-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (64, 'Informatik-Test-5AHIF-2', TO_TIMESTAMP('2024-02-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (65, 'Geschichte-Test-5AHIF-1', TO_TIMESTAMP('2023-12-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (66, 'Geschichte-Test-5AHIF-2', TO_TIMESTAMP('2024-03-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (67, 'Biologie-Test-5AHIF-1', TO_TIMESTAMP('2024-01-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 6);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (68, 'Biologie-Test-5AHIF-2', TO_TIMESTAMP('2024-04-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 6);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (69, 'Chemie-Test-5AHIF-1', TO_TIMESTAMP('2024-03-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (70, 'Chemie-Test-5AHIF-2', TO_TIMESTAMP('2024-06-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (71, 'Physik-Test-5AHIF-1', TO_TIMESTAMP('2024-05-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);
INSERT INTO exam(id, title, exam_date, subject_id, room_id)
VALUES (72, 'Physik-Test-5AHIF-2', TO_TIMESTAMP('2024-07-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6);


-- Participants 1AHIF
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 7, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 8, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 9, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 10, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 11, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 12, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 13, 1, 25);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 14, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 15, 1, 99);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (1, 16, 1, 81);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 7, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 8, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 9, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 10, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 11, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 12, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 13, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 14, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 15, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (2, 16, 1, 85);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 2, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 7, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 8, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 9, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 10, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 11, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 12, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 13, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 14, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 15, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (3, 16, 1, 85);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 2, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 7, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 8, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 9, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 10, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 11, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 12, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 13, 1, 25);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 14, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 15, 1, 99);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (4, 16, 1, 81);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 2, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 7, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 8, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 9, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 10, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 11, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 12, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 13, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 14, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 15, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (5, 16, 1, 85);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 2, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 7, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 8, 1, 62);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 9, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 10, 1, 54);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 11, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 12, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 13, 1, 58);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 14, 1, 69);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 15, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (6, 16, 1, 82);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 3, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 7, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 8, 1, 68);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 9, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 10, 1, 60);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 11, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 12, 1, 72);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 13, 1, 64);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 14, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 15, 1, 96);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (7, 16, 1, 88);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 3, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 7, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 8, 1, 72);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 9, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 10, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 11, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 12, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 13, 1, 62);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 14, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 15, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (8, 16, 1, 86);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 7, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 8, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 9, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 10, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 11, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 12, 1, 77);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 13, 1, 68);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 14, 1, 75);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 15, 1, 97);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (9, 16, 1, 90);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 7, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 8, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 9, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 10, 1, 65);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 11, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 12, 1, 72);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 13, 1, 67);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 14, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 15, 1, 94);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (10, 16, 1, 87);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 7, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 8, 1, 73);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 9, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 10, 1, 64);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 11, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 12, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 13, 1, 69);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 14, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 15, 1, 95);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (11, 16, 1, 89);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 7, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 8, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 9, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 10, 1, 62);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 11, 1, 83);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 12, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 13, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 14, 1, 75);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 15, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (12, 16, 1, 85);

-- Klasse 2BHIF

-- Für Examen 13
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 6, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 17, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 18, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 19, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 20, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 21, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 22, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 23, 1, 25);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 24, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 25, 1, 99);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (13, 26, 1, 81);

-- Für Examen 14
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 6, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 17, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 18, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 19, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 10, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 21, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 22, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 23, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 24, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 25, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (14, 26, 1, 85);

-- Für Examen 15
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 3, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 17, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 18, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 19, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 20, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 21, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 22, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 23, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 24, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 25, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (15, 26, 1, 85);

-- Für Examen 16
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 3, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 17, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 18, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 19, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 20, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 21, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 22, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 23, 1, 25);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 24, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 25, 1, 99);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (16, 26, 1, 81);

-- Für Examen 17
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 4, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 17, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 18, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 19, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 20, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 21, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 22, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 23, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 24, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 25, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (17, 26, 1, 85);

-- Für Examen 18
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 4, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 17, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 18, 1, 62);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 19, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 20, 1, 54);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 21, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 22, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 23, 1, 58);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 24, 1, 69);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 25, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (18, 26, 1, 82);

-- Für Examen 19
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 17, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 18, 1, 68);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 19, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 20, 1, 60);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 21, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 22, 1, 72);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 23, 1, 64);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 24, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 25, 1, 96);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (19, 26, 1, 88);

-- Für Examen 20
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 17, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 18, 1, 72);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 19, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 20, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 21, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 22, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 23, 1, 62);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 24, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 25, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (20, 26, 1, 86);

-- Für Examen 21
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 6, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 17, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 18, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 19, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 20, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 21, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 22, 1, 77);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 23, 1, 68);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 24, 1, 75);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 25, 1, 97);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (21, 26, 1, 90);

-- Für Examen 22
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 6, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 17, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 18, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 19, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 20, 1, 65);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 21, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 22, 1, 72);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 23, 1, 67);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 24, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 25, 1, 94);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (22, 26, 1, 87);

-- Für Examen 23
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 17, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 18, 1, 73);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 19, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 20, 1, 64);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 21, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 22, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 23, 1, 69);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 24, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 25, 1, 95);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (23, 26, 1, 89);

-- Für Examen 24
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 17, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 18, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 19, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 20, 1, 62);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 21, 1, 83);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 22, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 23, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 24, 1, 75);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 25, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (24, 26, 1, 85);

-- Klasse 2AHIF

-- Für Examen 25
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (25, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (25, 27, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (25, 28, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (25, 29, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (25, 30, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (25, 31, 1, 74);

-- Für Examen 26
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (26, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (26, 27, 1, 10);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (26, 28, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (26, 29, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (26, 30, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (26, 31, 1, 49);

-- Für Examen 27
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (27, 4, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (27, 27, 1, 60);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (27, 28, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (27, 29, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (27, 30, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (27, 31, 1, 63);

-- Für Examen 28
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (28, 4, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (28, 27, 1, 57);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (28, 28, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (28, 29, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (28, 30, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (28, 31, 1, 65);

-- Für Examen 29
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (29, 4, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (29, 27, 1, 37);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (29, 28, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (29, 29, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (29, 30, 1, 65);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (29, 31, 1, 85);

-- Für Examen 30
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (30, 4, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (30, 27, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (30, 28, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (30, 29, 1, 73);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (30, 30, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (30, 31, 1, 64);

-- Für Examen 31
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (31, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (31, 27, 1, 05);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (31, 28, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (31, 29, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (31, 30, 1, 69);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (31, 31, 1, 74);

-- Für Examen 32
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (32, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (32, 27, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (32, 28, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (32, 29, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (32, 30, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (32, 31, 1, 62);

-- Für Examen 33
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (33, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (33, 27, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (33, 28, 1, 83);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (33, 29, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (33, 30, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (33, 31, 1, 75);

-- Für Examen 34
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (34, 5, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (34, 27, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (34, 28, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (34, 29, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (34, 30, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (34, 31, 1, 74);

-- Für Examen 35
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (35, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (35, 27, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (35, 28, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (35, 29, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (35, 30, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (35, 31, 1, 49);

-- Für Examen 36
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (36, 1, 2, NULL);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (36, 27, 1, 23);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (36, 28, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (36, 29, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (36, 30, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (36, 31, 1, 63);

-- Klasse 3AHIF

-- Für Examen 37 (Mathematik-Test-3AHIF-1)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (37, 32, 1, 58);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (37, 33, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (37, 34, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (37, 35, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (37, 36, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (37, 6, 2, NULL);

-- Für Examen 38 (Mathematik-Test-3AHIF-2)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (38, 32, 1, 98);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (38, 33, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (38, 34, 1, 56);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (38, 35, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (38, 36, 1, 49);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (38, 6, 2, NULL);

-- Für Examen 39 (Informatik-Test-3AHIF-1)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (39, 32, 1, 68);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (39, 33, 1, 80);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (39, 34, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (39, 35, 1, 55);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (39, 36, 1, 63);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (39, 2, 2, NULL);

-- Für Examen 40 (Informatik-Test-3AHIF-2)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (40, 32, 1, 77);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (40, 33, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (40, 34, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (40, 35, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (40, 36, 1, 65);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (40, 2, 2, NULL);

-- Für Examen 41 (Geschichte-Test-3AHIF-1)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (41, 32, 1, 23);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (41, 33, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (41, 34, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (41, 35, 1, 65);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (41, 36, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (41, 5, 2, NULL);

-- Für Examen 42 (Geschichte-Test-3AHIF-2)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (42, 32, 1, 65);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (42, 33, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (42, 34, 1, 73);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (42, 35, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (42, 36, 1, 64);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (42, 5, 2, NULL);

-- Für Examen 43 (Biologie-Test-3AHIF-1)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (43, 32, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (43, 33, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (43, 34, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (43, 35, 1, 69);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (43, 36, 1, 74);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (43, 6, 2, NULL);

-- Für Examen 44 (Biologie-Test-3AHIF-2)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (44, 32, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (44, 33, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (44, 34, 1, 77);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (44, 35, 1, 68);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (44, 36, 1, 75);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (44, 6, 2, NULL);

-- Für Examen 45 (Chemie-Test-3AHIF-1)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (45, 32, 1, 65);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (45, 33, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (45, 34, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (45, 35, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (45, 36, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (45, 5, 2, NULL);

-- Für Examen 46 (Chemie-Test-3AHIF-2)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (46, 32, 1, 72);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (46, 33, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (46, 34, 1, 70);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (46, 35, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (46, 36, 1, 62);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (46, 5, 2, NULL);

-- Für Examen 47 (Physik-Test-3AHIF-1)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (47, 32, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (47, 33, 1, 83);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (47, 34, 1, 71);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (47, 35, 1, 66);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (47, 36, 1, 75);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (47, 6, 2, NULL);

-- Für Examen 48 (Physik-Test-3AHIF-2)
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (48, 32, 1, 33);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (48, 33, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (48, 34, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (48, 35, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (48, 36, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (48, 6, 2, NULL);

-- Klasse 4AHIF

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (49, 37, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (49, 38, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (49, 39, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (49, 40, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (49, 41, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (49, 1, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (50, 37, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (50, 38, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (50, 39, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (50, 40, 1, 82);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (50, 41, 1, 95);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (50, 1, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (51, 37, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (51, 38, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (51, 39, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (51, 40, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (51, 41, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (51, 4, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (52, 37, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (52, 38, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (52, 39, 1, 82);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (52, 40, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (52, 41, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (52, 4, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (53, 37, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (53, 38, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (53, 39, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (53, 40, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (53, 41, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (53, 2, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (54, 37, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (54, 38, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (54, 39, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (54, 40, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (54, 41, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (54, 2, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (55, 37, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (55, 38, 1, 82);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (55, 39, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (55, 40, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (55, 41, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (55, 3, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (56, 37, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (56, 38, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (56, 39, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (56, 40, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (56, 41, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (56, 3, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (57, 37, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (57, 38, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (57, 39, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (57, 40, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (57, 41, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (57, 6, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (58, 37, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (58, 38, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (58, 39, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (58, 40, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (58, 41, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (58, 6, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (59, 37, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (59, 38, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (59, 39, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (59, 40, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (59, 41, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (59, 1, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (60, 37, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (60, 38, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (60, 39, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (60, 40, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (60, 41, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (60, 1, 2, NULL);

-- Klasse 5AHIF

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (61, 42, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (61, 43, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (61, 44, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (61, 45, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (61, 46, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (61, 6, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (62, 42, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (62, 43, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (62, 44, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (62, 45, 1, 82);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (62, 46, 1, 95);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (62, 6, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (63, 42, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (63, 43, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (63, 44, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (63, 45, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (63, 46, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (63, 2, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (64, 42, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (64, 43, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (64, 44, 1, 82);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (64, 45, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (64, 46, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (64, 2, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (65, 42, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (65, 43, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (65, 44, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (65, 45, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (65, 46, 1, 81);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (65, 4, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (66, 42, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (66, 43, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (66, 44, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (66, 45, 1, 86);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (66, 46, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (66, 4, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (67, 42, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (67, 43, 1, 82);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (67, 44, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (67, 45, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (67, 46, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (67, 3, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (68, 42, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (68, 43, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (68, 44, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (68, 45, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (68, 46, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (68, 3, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (69, 42, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (69, 43, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (69, 44, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (69, 45, 1, 79);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (69, 46, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (69, 5, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (70, 42, 1, 89);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (70, 43, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (70, 44, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (70, 45, 1, 93);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (70, 46, 1, 87);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (70, 5, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (71, 42, 1, 78);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (71, 43, 1, 85);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (71, 44, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (71, 45, 1, 90);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (71, 46, 1, 92);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (71, 5, 2, NULL);

INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (72, 42, 1, 76);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (72, 43, 1, 91);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (72, 44, 1, 84);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (72, 46, 1, 88);
INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
VALUES (72, 5, 2, NULL);

COMMIT;