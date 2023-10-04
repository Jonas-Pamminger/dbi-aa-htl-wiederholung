-- 1. Jährlicher Notenschnitt eines Schülers auslesen
SELECT Round(AVG(p.score), 2) AS Durchschnittsnote
FROM Participant p
JOIN Exam t ON p.exam_id = t.id
JOIN Person pe ON p.person_id = pe.id
WHERE pe.firstname = 'Max' AND pe.lastname = 'Mustermann'
  AND t.EXAM_DATE BETWEEN TO_TIMESTAMP('2023-09-11 10:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_TIMESTAMP('2024-09-11 11:00:00', 'YYYY-MM-DD HH24:MI:SS');

-- 2. Prüfungsergebnisse für einen bestimmten Test anzeigen
SELECT pe.firstname || ' ' || pe.lastname AS Schüler, p.score AS Note
FROM Participant p
JOIN Exam t ON p.exam_id = t.id
JOIN Person pe ON p.person_id = pe.id
WHERE t.id = 1
AND SCORE IS NOT NULL;

-- 3. Noten aller Schüler in einer Klasse in einem bestimmten Fach (XXX)
select P2.FIRSTNAME || ' ' || P2.lastname AS Schüler,  AVG(p.score) AS Durchschnittsnote FROM Participant p
JOIN PERSON P2 on p.PERSON_ID = P2.ID
JOIN CLASS C2 on P2.CLASS_ID = C2.ID
JOIN Exam T on T.ID = p.exam_id
JOIN SUBJECT S2 on T.SUBJECT_ID = S2.ID
where C2.NAME = '5AHIF' AND S2.NAME = 'Mathematik'
GROUP BY P2.FIRSTNAME, P2.LASTNAME;

-- 4. Die Teilnehmer eines Tests und deren Rollen
SELECT pe.firstname || ' ' || pe.lastname AS Person, tr.role AS Rolle
FROM Participant p
JOIN Exam t ON p.exam_id = t.id
JOIN Person pe ON p.person_id = pe.id
JOIN EXAMROLE tr ON p.EXAM_ROLE_ID = tr.id
WHERE t.title = 'Mathematik-Test-3AHIF-1';

-- 5. Alle Tests für ein bestimmtes Fach auflisten
SELECT title AS Test
FROM Exam
WHERE subject_id = (SELECT id FROM Subject WHERE name = 'Mathematik');

-- 6. Eine Aufsichtsperson für einen bestimmten Test, mit gewisser Qualifikation
SELECT pe.firstname || ' ' || pe.lastname AS Person from Exam t
Join Competence c on t.subject_id = c.subject_id
Join Person pe on c.person_id = pe.id
where t.title = 'Mathematik-Test-3AHIF-1';

-- 7. Durchschnittliche Erfolgsquote einer Klasse/Fach
SELECT Round(AVG(p.score),2) AS Durchschnittliche_Erfolgsquote from Participant p
JOIN Exam T on T.ID = p.exam_id
JOIN SUBJECT S2 on S2.ID = T.SUBJECT_ID
JOIN PERSON P2 on p.PERSON_ID = P2.ID
JOIN CLASS C2 on P2.CLASS_ID = C2.ID
where s2.NAME = 'Mathematik' and C2.NAME = '4AHIF';


-- 8. Query to find free rooms for a specific date
SELECT
    r.id AS room_id,
    r.designation AS room_designation,
    rt.ROOM_TYPE AS room_type
FROM Room r
JOIN ROOMTYPE rt ON r.type_id = rt.id
WHERE NOT EXISTS (
    SELECT 1
    FROM Exam t
    WHERE t.room_id = r.id
      AND t.EXAM_DATE >= TO_DATE('2023-10-15', 'YYYY-MM-DD') -- Specify the desired date
      AND t.EXAM_DATE < TO_DATE('2023-10-16', 'YYYY-MM-DD') -- Specify the next day
);

