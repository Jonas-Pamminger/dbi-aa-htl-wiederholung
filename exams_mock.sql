--------------------------------------------
-- Initialize Mockup data
--------------------------------------------
-- Fächer
INSERT INTO organisation.Subject (id, name) VALUES (1, 'Mathematik');
INSERT INTO organisation.Subject (id, name) VALUES (2, 'Informatik');
INSERT INTO organisation.Subject (id, name) VALUES (3, 'Geschichte');
INSERT INTO organisation.Subject (id, name) VALUES (4, 'Biologie');
INSERT INTO organisation.Subject (id, name) VALUES (5, 'Chemie');
INSERT INTO organisation.Subject (id, name) VALUES (6, 'Physik');

-- Klassen
INSERT INTO organisation.Class (id, name) VALUES (1, 'Klasse A');
INSERT INTO organisation.Class (id, name) VALUES (2, 'Klasse B');
INSERT INTO organisation.Class (id, name) VALUES (3, 'Klasse C');
INSERT INTO organisation.Class (id, name) VALUES (4, 'Klasse D');

-- Personen
INSERT INTO organisation.Person (id, firstname, lastname, class_id) VALUES (1, 'Max', 'Mustermann', 1);
INSERT INTO organisation.Person (id, firstname, lastname, class_id) VALUES (2, 'Lisa', 'Musterfrau', 2);
INSERT INTO organisation.Person (id, firstname, lastname) VALUES (3, 'Lehrer', 'Lehrerson');
INSERT INTO organisation.Person (id, firstname, lastname, class_id) VALUES (4, 'Paul', 'Schüler', 1);
INSERT INTO organisation.Person (id, firstname, lastname, class_id) VALUES (5, 'Anna', 'Schülerin', 2);
INSERT INTO organisation.Person (id, firstname, lastname) VALUES (6, 'Lehrer2', 'Lehrerson2');

-- Kompetenzen
INSERT INTO organisation.Competence (id, description, person_id, subject_id) VALUES (1, 'Mathematiklehrer', 3, 1);
INSERT INTO organisation.Competence (id, description, person_id, subject_id) VALUES (2, 'Informatiklehrer', 3, 2);
INSERT INTO organisation.Competence (id, description, person_id, subject_id) VALUES (3, 'Geschichtslehrer', 3, 3);
INSERT INTO organisation.Competence (id, description, person_id, subject_id) VALUES (4, 'Biologielehrer', 6, 4);
INSERT INTO organisation.Competence (id, description, person_id, subject_id) VALUES (5, 'Chemielehrer', 6, 5);
INSERT INTO organisation.Competence (id, description, person_id, subject_id) VALUES (6, 'Physiklehrer', 6, 6);

-- Raumtypen
INSERT INTO organisation.RoomType (id, type) VALUES (1, 'Klassenzimmer');
INSERT INTO organisation.RoomType (id, type) VALUES (2, 'EDV-Saal');

-- Räume
INSERT INTO organisation.Room (id, designation, type_id) VALUES (1, 'Raum 101', 1);
INSERT INTO organisation.Room (id, designation, type_id) VALUES (2, 'EDV-Saal 1', 2);
INSERT INTO organisation.Room (id, designation, type_id) VALUES (3, 'Raum 102', 1);
INSERT INTO organisation.Room (id, designation, type_id) VALUES (4, 'EDV-Saal 2', 2);

-- Rollen
INSERT INTO organisation.ExamRole (id, role) VALUES (1, 'Schüler');
INSERT INTO organisation.ExamRole (id, role) VALUES (2, 'Prüfer');
INSERT INTO organisation.ExamRole (id, role) VALUES (3, 'Aufsichtsperson');

-- Tests
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (1, 'Mathe-Test', TO_TIMESTAMP('2023-09-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (9, 'Mathe-Test', TO_TIMESTAMP('2023-09-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (10, 'Mathe-Test', TO_TIMESTAMP('2023-09-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (8, 'Mathe-Test', TO_TIMESTAMP('2024-05-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (7, 'Mathe-Test', TO_TIMESTAMP('2023-09-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (2, 'Informatik-Test', TO_TIMESTAMP('2023-10-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (3, 'Biologie-Test', TO_TIMESTAMP('2023-10-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 3);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (4, 'Chemie-Test', TO_TIMESTAMP('2023-10-12 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 4);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (5, 'Physik-Test', TO_TIMESTAMP('2023-10-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 3);
INSERT INTO organisation.Exam (id, title, exam_date, subject_id, room_id) VALUES (6, 'Physik-Test', TO_TIMESTAMP('2023-10-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 3);

-- Teilnehmer
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (1, 1, 1, 85);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (1, 2, 1, 92);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (1, 3, 2, NULL);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (2, 1, 2, NULL);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (3, 4, 1, 88);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (3, 5, 1, 90);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (4, 4, 2, NULL);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (4, 6, 2, NULL);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (5, 5, 2, NULL);
INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id, score) VALUES (5, 6, 2, NULL);

COMMIT;