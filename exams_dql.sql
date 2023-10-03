-- 1. Jährlicher Notenschnitt eines Schülers auslesen
SELECT AVG(p.score) AS Durchschnittsnote
FROM organisation.Participant p
JOIN organisation.Exam t ON p.exam_id = t.id
JOIN organisation.Person pe ON p.person_id = pe.id
WHERE pe.firstname = 'Max' AND pe.lastname = 'Mustermann'
  AND t.EXAM_DATE BETWEEN TO_TIMESTAMP('2023-09-11 10:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_TIMESTAMP('2024-09-11 11:00:00', 'YYYY-MM-DD HH24:MI:SS');

-- 2. Prüfungsergebnisse für einen bestimmten Test anzeigen
SELECT pe.firstname || ' ' || pe.lastname AS Schüler, p.score AS Note
FROM organisation.Participant p
JOIN organisation.Exam t ON p.exam_id = t.id
JOIN organisation.Person pe ON p.person_id = pe.id
WHERE t.id = 1
AND SCORE IS NOT NULL;

-- 3. Noten aller Schüler in einer Klasse in einem bestimmten Fach (XXX)
select P2.FIRSTNAME || ' ' || P2.lastname AS Schüler,  AVG(p.score) AS Durchschnittsnote FROM organisation.Participant p
JOIN organisation.Person P2 on p.PERSON_ID = P2.ID
JOIN organisation.Class C2 on P2.CLASS_ID = C2.ID
JOIN organisation.Exam T on T.ID = p.Exam_ID
JOIN organisation.Subject S2 on T.SUBJECT_ID = S2.ID
where C2.NAME = 'Klasse A' AND S2.NAME = 'Mathematik'
GROUP BY P2.FIRSTNAME, P2.LASTNAME;

-- 4. Die Teilnehmer eines Tests und deren Rollen
SELECT pe.firstname || ' ' || pe.lastname AS Person, tr.role AS Rolle
FROM organisation.Participant p
JOIN organisation.Exam t ON p.exam_id = t.id
JOIN organisation.Person pe ON p.person_id = pe.id
JOIN organisation.ExamRole tr ON p.exam_role_id = tr.id
WHERE t.title = 'Mathe-Test';

-- 5. Alle Tests für ein bestimmtes Fach auflisten
SELECT title AS Exam
FROM organisation.Exam
WHERE subject_id = (SELECT id FROM organisation.Subject WHERE name = 'Mathematik');

-- 6. Eine Aufsichtsperson für einen bestimmten Test, mit gewisser Qualifikation
SELECT pe.firstname || ' ' || pe.lastname AS Person from organisation.Exam t
Join organisation.Competence c on t.subject_id = c.subject_id
Join organisation.Person pe on c.person_id = pe.id
where t.title = 'Physik-Test';

-- 7. Durchschnittliche Erfolgsquote einer Klasse/Fach
SELECT AVG(p.score) AS Durchschnittliche_Erfolgsquote from organisation.Participant p
JOIN organisation.Exam T on T.ID = p.EXAM_ID
JOIN organisation.Subject S2 on S2.ID = T.SUBJECT_ID
JOIN organisation.Person P2 on p.PERSON_ID = P2.ID
JOIN organisation.Class C2 on P2.CLASS_ID = C2.ID
where s2.NAME = 'Mathematik' and C2.NAME = 'Klasse A';


-- 8. Query to find free rooms for a specific date
SELECT
    r.id AS room_id,
    r.designation AS room_designation,
    rt.type AS room_type
FROM organisation.Room r
JOIN organisation.RoomType rt ON r.type_id = rt.id
WHERE NOT EXISTS (
    SELECT 1
    FROM organisation.Exam t
    WHERE t.room_id = r.id
      AND t.exam_date >= TO_DATE('2023-09-27', 'YYYY-MM-DD') -- Specify the desired date
      AND t.exam_date < TO_DATE('2023-09-28', 'YYYY-MM-DD') -- Specify the next day
);