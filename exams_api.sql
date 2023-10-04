CREATE OR REPLACE PACKAGE exams_manager AS
    -- Test-Eintrag: Einen Test mit einer Klasse anlegen
    FUNCTION CreateTest(
        title VARCHAR2,
        test_date TIMESTAMP,
        examiner_id NUMBER DEFAULT NULL,
        subject_id NUMBER,
        class_id NUMBER DEFAULT NULL
    ) RETURN NUMBER;

    -- Hinzufügen weiterer Teilnehmer: Eine Klasse, ein einzelner Schüler oder eine weitere Rolle (zB.: Aufsichtsperson) können zu einem Test ergänzt werden
    PROCEDURE AddParticipants(
        test_id NUMBER,
        class_id NUMBER DEFAULT NULL,
        person_id NUMBER DEFAULT NULL,
        test_role_id NUMBER DEFAULT NULL
    );

    -- Find-Replacement: Bei Verhinderung des vorherigen Prüfers wird ein Ersatz-Prüfer mit den nötigen Kompetenzen gesucht, und falls verfügbar, eingetragen
    FUNCTION FindReplacementExaminer(
        test_id NUMBER,
        old_examiner_id NUMBER
    ) RETURN NUMBER;

    -- Find-Available-Room: Finde einen Raum mit einer entsprechenden Raumart
    FUNCTION FindAvailableRoom(
        room_type VARCHAR2,
        test_date TIMESTAMP
    ) RETURN NUMBER;

    -- Grade-Student: Trage für einen Schüler eine Note ein
    PROCEDURE GradeStudent(
        test_id NUMBER,
        person_id NUMBER,
        score NUMBER
    );

    -- Calculate-Grade-Average: Berechne für eine Klasse den Notendurchschnitt
    FUNCTION CalculateGradeAverage(
        class_id NUMBER
    ) RETURN NUMBER;

    -- Reserve-Room: Trage zum Test einen Raum ein, falls frei
    PROCEDURE ReserveRoom(
        test_id NUMBER,
        room_id NUMBER
    );

    -- Ascend-Class: Erhöhe die Schulstufe der Klasse
    PROCEDURE AscendClass(
        class_id NUMBER,
        new_class_name VARCHAR2
    );

    FUNCTION CreateTest(
        title VARCHAR2,
        test_date TIMESTAMP,
        examiner_id NUMBER DEFAULT NULL,
        subject_id NUMBER,
        class_id NUMBER DEFAULT NULL
    ) RETURN NUMBER;

    -- CRUD for Subject
    FUNCTION CreateSubject(
        name VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadSubject(
        name VARCHAR2
    ) RETURN SUBJECT%rowtype;

    PROCEDURE UpdateSubject(
        old_name VARCHAR2,
        new_name VARCHAR2
    );

    PROCEDURE DeleteSubject(
        name VARCHAR2
    );

    -- CRUD for Class
    FUNCTION CreateClass(
        name VARCHAR2,
        subject_id NUMBER
    ) RETURN NUMBER;

    FUNCTION ReadClass(
        name VARCHAR2
    ) RETURN CLASS%rowtype;

    PROCEDURE UpdateClass(
        old_name VARCHAR2,
        new_name VARCHAR2,
        subject_id NUMBER
    );

    PROCEDURE DeleteClass(
        name VARCHAR2
    );

    -- CRUD for Person
    FUNCTION CreatePerson(
        first_name VARCHAR2,
        last_name VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadPerson(
        first_name VARCHAR2,
        last_name VARCHAR2
    ) RETURN PERSON%rowtype;

    PROCEDURE UpdatePerson(
        old_first_name VARCHAR2,
        old_last_name VARCHAR2,
        new_first_name VARCHAR2,
        new_last_name VARCHAR2
    );

    PROCEDURE DeletePerson(
        first_name VARCHAR2,
        last_name VARCHAR2
    );

    -- CRUD for Competence
    FUNCTION CreateCompetence(
        description VARCHAR2
    ) RETURN NUMBER;

    FUNCTION CreateCompetenceWithPerson(
        description VARCHAR2,
        person_id NUMBER
    ) RETURN NUMBER;

    FUNCTION CreateCompetenceWithPersonAndSubject(
        description VARCHAR2,
        person_id NUMBER,
        subject_id NUMBER
    ) RETURN NUMBER;

    FUNCTION ReadCompetence(
        description VARCHAR2
    ) RETURN COMPETENCE%rowtype;

    PROCEDURE UpdateCompetence(
        old_description VARCHAR2,
        new_description VARCHAR2,
        person_id NUMBER,
        subject_id NUMBER
    );

    PROCEDURE DeleteCompetence(
        description VARCHAR2
    );

    -- CRUD for RoomType
    FUNCTION CreateRoomType(
        room_type VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE UpdateRoomType(
        old_room_type VARCHAR2,
        new_room_type VARCHAR2
    );

    PROCEDURE DeleteRoomType(
        room_type VARCHAR2
    );

    -- CRUD for Room
    FUNCTION CreateRoom(
        designation VARCHAR2,
        room_type_id NUMBER
    ) RETURN NUMBER;

    FUNCTION ReadRoomByDesignation(
        designation VARCHAR2
    ) RETURN ROOM%rowtype;

    PROCEDURE UpdateRoom(
        old_room_id NUMBER,
        new_room_type_id NUMBER
    );

    PROCEDURE DeleteRoom(
        room_id NUMBER
    );

    -- CRUD for ExamRole
    FUNCTION CreateExamRole(
        role_name VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadExamRole(
        role_name VARCHAR2
    ) RETURN EXAMROLE%rowtype;

    PROCEDURE UpdateExamRole(
        old_role_name VARCHAR2,
        new_role_name VARCHAR2
    );

    PROCEDURE DeleteExamRole(
        role_name VARCHAR2
    );

    -- CRUD for Exam
    FUNCTION CreateExam(
        title VARCHAR2,
        exam_date TIMESTAMP,
        subject_id NUMBER,
        room_id NUMBER DEFAULT NULL
    ) RETURN NUMBER;

    PROCEDURE UpdateExam(
        exam_id NUMBER,
        title VARCHAR2,
        exam_date TIMESTAMP,
        subject_id NUMBER,
        room_id NUMBER DEFAULT NULL
    );

    PROCEDURE DeleteExam(
        exam_id NUMBER
    );

    -- CRUD for Participant
    PROCEDURE CreateParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER,
        score NUMBER DEFAULT NULL
    );

    FUNCTION ReadParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER
    ) RETURN PARTICIPANT%rowtype;

    PROCEDURE UpdateParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER,
        score NUMBER
    );

    PROCEDURE DeleteParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER
    );

    -- DQL Select Statements

    -- 1. Jährlicher Notenschnitt eines Schülers auslesen
    FUNCTION get_avg_student_grade(
        p_firstname VARCHAR2,
        p_lastname VARCHAR2,
        p_start_date DATE,
        p_end_date DATE
    ) RETURN NUMBER;

    -- 2. Prüfungsergebnisse für einen bestimmten Test anzeigen
    FUNCTION get_test_results(
        p_test_id NUMBER
    ) RETURN SYS_REFCURSOR;

    -- 3. Noten aller Schüler in einer Klasse in einem bestimmten Fach
    FUNCTION get_class_subject_grades(
        p_class_name VARCHAR2,
        p_subject_name VARCHAR2
    ) RETURN SYS_REFCURSOR;

    -- 4. Die Teilnehmer eines Tests und deren Rollen
    FUNCTION get_test_participants(
        p_test_title VARCHAR2
    ) RETURN SYS_REFCURSOR;

    -- 5. Alle Tests für ein bestimmtes Fach auflisten
    FUNCTION get_tests_by_subject(
        p_subject_name VARCHAR2
    ) RETURN SYS_REFCURSOR;

    -- 6. Eine Aufsichtsperson für einen bestimmten Test, mit gewisser Qualifikation
    FUNCTION get_test_supervisor(
        p_test_title VARCHAR2
    ) RETURN SYS_REFCURSOR;

    -- 7. Durchschnittliche Erfolgsquote einer Klasse/Fach
    FUNCTION get_class_subject_success_rate(
        p_class_name VARCHAR2,
        p_subject_name VARCHAR2
    ) RETURN NUMBER;

    -- 8. Query to find free rooms for a specific date
    FUNCTION find_free_rooms(
        p_date DATE
    ) RETURN SYS_REFCURSOR;

END exams_manager;
/

CREATE OR REPLACE PACKAGE BODY exams_manager AS

    PROCEDURE AddParticipants(
        test_id NUMBER,
        class_id NUMBER DEFAULT NULL,
        person_id NUMBER DEFAULT NULL,
        test_role_id NUMBER DEFAULT NULL
    ) AS
    BEGIN
        -- Insert participant records into the Participant table based on parameters
        IF class_id IS NOT NULL THEN
            INSERT INTO Participant (exam_id, person_id, exam_role_id)
            SELECT test_id, person_id, test_role_id
            FROM Person
            WHERE class_id = class_id;
        END IF;

        IF person_id IS NOT NULL THEN
            INSERT INTO Participant (exam_id, person_id, exam_role_id)
            VALUES (test_id, person_id, test_role_id);
        END IF;
    END AddParticipants;

    FUNCTION FindReplacementExaminer(
        test_id NUMBER
    ) RETURN NUMBER AS
        Examiner NUMBER;
    BEGIN
        SELECT pe.id
        INTO Examiner
        FROM Exam t
                 JOIN Competence c ON t.subject_id = c.subject_id
                 JOIN Person pe ON c.person_id = pe.id
        WHERE t.id = test_id;

        RETURN Examiner;
    END FindReplacementExaminer;

    FUNCTION FindAvailableRoom(
        room_type VARCHAR2,
        test_date TIMESTAMP
    ) RETURN NUMBER AS
        room_id NUMBER;
    BEGIN
        SELECT r.id
        INTO room_id
        FROM Room r
                 JOIN RoomType rt ON r.type_id = rt.id
        WHERE NOT EXISTS (SELECT 1
                          FROM Exam t
                          WHERE t.room_id = r.id
                            AND t.exam_date >= test_date -- Use the parameter directly, no need to use TO_DATE
                            AND t.exam_date < test_date + INTERVAL '1' DAY);

        RETURN room_id;
    END FindAvailableRoom;

    PROCEDURE GradeStudent(
        test_id NUMBER,
        person_id NUMBER,
        score NUMBER
    ) AS
    BEGIN
        -- Insert the student's score into the Participant table
        UPDATE Participant
        SET score = score
        WHERE exam_id = test_id
          AND person_id = person_id;
    END GradeStudent;

    FUNCTION CalculateGradeAverage(
        class_id NUMBER
    ) RETURN NUMBER AS
        avg_score NUMBER;
    BEGIN


        RETURN 0;
    END CalculateGradeAverage;

    PROCEDURE ReserveRoom(
        test_id NUMBER,
        room_id NUMBER
    ) AS
    BEGIN
        -- Update the Exam record to set the room_id
        UPDATE Exam
        SET room_id = room_id
        WHERE id = test_id;
    END ReserveRoom;

    PROCEDURE AscendClass(
        class_id NUMBER,
        new_class_name VARCHAR2
    ) AS
    BEGIN
        -- Update the Class record to change the class name
        UPDATE Class
        SET name = new_class_name
        WHERE id = class_id;
    END AscendClass;

    FUNCTION CreateTest(
        title VARCHAR2,
        test_date TIMESTAMP,
        examiner_id NUMBER DEFAULT NULL,
        subject_id NUMBER,
        class_id NUMBER DEFAULT NULL
    ) RETURN NUMBER AS
        test_id NUMBER;
    BEGIN
        -- Insert the test record into the Exam table
        INSERT INTO Exam (title, exam_date, subject_id)
        VALUES (title, test_date, subject_id)
        RETURNING id INTO test_id;

        -- If an examiner_id is provided, add the examiner as a participant
        IF examiner_id IS NOT NULL THEN
            AddParticipants(test_id, NULL, examiner_id, 1);
        END IF;

        -- If a class_id is provided, add the class as a participant
        IF class_id IS NOT NULL THEN
            AddParticipants(test_id, class_id, NULL, NULL);
        END IF;

        -- Return the test_id
        RETURN test_id;
    END CreateTest;

    -- CRUD operations for Subject, Class, Person, Competence, RoomType, Room, ExamRole, Exam, and Participant go here

    -- CRUD operations for Subject
    FUNCTION CreateSubject(
        name VARCHAR2
    ) RETURN NUMBER AS
        subject_id NUMBER;
    BEGIN
        -- Insert a new subject record into the Subject table
        INSERT INTO Subject (name)
        VALUES (name)
        RETURNING id INTO subject_id;

        RETURN subject_id;
    END CreateSubject;

    FUNCTION ReadSubject(
        name VARCHAR2
    ) RETURN SUBJECT%ROWTYPE AS
        subject_record SUBJECT%ROWTYPE;
    BEGIN
        -- Retrieve the subject record based on the subject name
        SELECT *
        INTO subject_record
        FROM Subject s
        WHERE s.name = name;

        RETURN subject_record;
    END ReadSubject;


    PROCEDURE UpdateSubject(
        old_name VARCHAR2,
        new_name VARCHAR2
    ) AS
    BEGIN
        -- Update the subject record based on the old name and new name
        UPDATE Subject
        SET name = new_name
        WHERE name = old_name;
    END UpdateSubject;

    PROCEDURE DeleteSubject(
        name VARCHAR2
    ) AS
    BEGIN
        -- Delete the subject record based on the subject name
        DELETE
        FROM Subject
        WHERE name = name;
    END DeleteSubject;

    -- CRUD operations for Class
    FUNCTION CreateClass(
        name VARCHAR2,
        subject_id NUMBER
    ) RETURN NUMBER AS
        class_id NUMBER;
    BEGIN
        -- Insert a new class record into the Class table
        INSERT INTO Class (name, id)
        VALUES (name, subject_id)
        RETURNING id INTO class_id;

        RETURN class_id;
    END CreateClass;

    FUNCTION ReadClass(
        name VARCHAR2
    ) RETURN CLASS%rowtype AS
        class_record CLASS%rowtype;
    BEGIN
        -- Retrieve the class_id based on the class name
        SELECT *
        INTO class_record
        FROM Class
        WHERE name = name;

        RETURN class_record;
    END ReadClass;

    PROCEDURE UpdateClass(
        old_name VARCHAR2,
        new_name VARCHAR2,
        subject_id NUMBER
    ) AS
    BEGIN
        -- Update the class record based on the old name
        UPDATE Class
        SET name = new_name,
            id   = subject_id
        WHERE name = old_name;
    END UpdateClass;

    PROCEDURE DeleteClass(
        name VARCHAR2
    ) AS
    BEGIN
        -- Delete the class record based on the class name
        DELETE
        FROM Class
        WHERE name = name;
    END DeleteClass;

    -- CRUD operations for Person
    FUNCTION CreatePerson(
        first_name VARCHAR2,
        last_name VARCHAR2
    ) RETURN NUMBER AS
        person_id NUMBER;
    BEGIN
        -- Insert a new person record into the Person table
        INSERT INTO Person (firstname, lastname)
        VALUES (first_name, last_name)
        RETURNING id INTO person_id;

        RETURN person_id;
    END CreatePerson;

    FUNCTION ReadPerson(
        first_name VARCHAR2,
        last_name VARCHAR2
    ) RETURN PERSON%rowtype AS
        person_record PERSON%rowtype;
    BEGIN
        -- Retrieve the person_id based on the first name and last name
        SELECT *
        INTO person_record
        FROM Person p
        WHERE p.firstname = first_name
          AND p.lastname = last_name;

        RETURN person_record;
    END ReadPerson;

    PROCEDURE UpdatePerson(
        old_first_name VARCHAR2,
        old_last_name VARCHAR2,
        new_first_name VARCHAR2,
        new_last_name VARCHAR2
    ) AS
    BEGIN
        -- Update the person record based on the first name and last name
        UPDATE Person
        SET firstname = new_first_name,
            lastname  = new_last_name
        WHERE firstname = old_first_name
          AND lastname = old_last_name;
    END UpdatePerson;

    PROCEDURE DeletePerson(
        first_name VARCHAR2,
        last_name VARCHAR2
    ) AS
    BEGIN
        -- Delete the person record based on the first name and last name
        DELETE
        FROM Person
        WHERE firstname = first_name
          AND lastname = last_name;
    END DeletePerson;

    -- CRUD operations for Competence
    FUNCTION CreateCompetence(
        description VARCHAR2
    ) RETURN NUMBER AS
        competence_id NUMBER;
    BEGIN
        -- Insert a new competence record into the Competence table
        INSERT INTO Competence (description)
        VALUES (description)
        RETURNING id INTO competence_id;

        RETURN competence_id;
    END CreateCompetence;

    FUNCTION CreateCompetenceWithPerson(
        description VARCHAR2,
        person_id NUMBER
    ) RETURN NUMBER AS
        competence_id NUMBER;
    BEGIN
        -- Insert a new competence record into the Competence table with a person_id
        INSERT INTO Competence (description, person_id)
        VALUES (description, person_id)
        RETURNING id INTO competence_id;

        RETURN competence_id;
    END CreateCompetenceWithPerson;

    FUNCTION CREATECOMPETENCEWITHPERSONANDSUBJECT(
        description VARCHAR2,
        person_id NUMBER,
        subject_id NUMBER
    ) RETURN NUMBER AS
        competence_id NUMBER;
    BEGIN
        -- Insert a new competence record into the Competence table with person_id and subject_id
        INSERT INTO Competence (description, person_id, subject_id)
        VALUES (description, person_id, subject_id)
        RETURNING id INTO competence_id;

        RETURN competence_id;
    END CREATECOMPETENCEWITHPERSONANDSUBJECT;

    FUNCTION ReadCompetence(
        description VARCHAR2
    ) RETURN COMPETENCE%rowtype AS
        competence_record COMPETENCE%rowtype;
    BEGIN
        -- Retrieve the competence_id based on the description
        SELECT *
        INTO competence_record
        FROM Competence c
        WHERE c.description = description;

        RETURN competence_record;
    END ReadCompetence;

    PROCEDURE UpdateCompetence(
        old_description VARCHAR2,
        new_description VARCHAR2,
        person_id NUMBER,
        subject_id NUMBER
    ) AS
    BEGIN
        -- Update the competence record based on the description, person_id, and subject_id
        UPDATE Competence
        SET person_id   = person_id,
            subject_id  = subject_id,
            description = new_description
        WHERE description = old_description;
    END UpdateCompetence;

    PROCEDURE DeleteCompetence(
        description VARCHAR2
    ) AS
    BEGIN
        -- Delete the competence record based on the description
        DELETE
        FROM Competence
        WHERE description = description;
    END DeleteCompetence;

    -- CRUD operations for RoomType
    FUNCTION CreateRoomType(
        room_type VARCHAR2
    ) RETURN NUMBER AS
        room_type_id NUMBER;
    BEGIN
        -- Insert a new room type record into the RoomType table
        INSERT INTO RoomType (room_type)
        VALUES (room_type)
        RETURNING id INTO room_type_id;

        RETURN room_type_id;
    END CreateRoomType;

    PROCEDURE UpdateRoomType(
        old_room_type VARCHAR2,
        new_room_type VARCHAR2
    ) AS
    BEGIN
        -- Update the room type record based on the room type
        UPDATE RoomType
        SET room_type = new_room_type
        WHERE room_type = old_room_type;
    END UpdateRoomType;

    PROCEDURE DeleteRoomType(
        room_type VARCHAR2
    ) AS
    BEGIN
        -- Delete the room type record based on the room type
        DELETE
        FROM RoomType r
        WHERE r.room_type = room_type;
    END DeleteRoomType;

    -- CRUD operations for Room
    FUNCTION CreateRoom(
        designation VARCHAR2,
        room_type_id NUMBER
    ) RETURN NUMBER AS
        room_id NUMBER;
    BEGIN
        -- Insert a new room record into the Room table
        INSERT INTO Room (designation, type_id)
        VALUES (designation, room_type_id)
        RETURNING id INTO room_id;

        RETURN room_id;
    END CreateRoom;

    FUNCTION READROOMBYDESIGNATION(
        designation VARCHAR2
    ) RETURN ROOM%rowtype AS
        room_record ROOM%rowtype;
    BEGIN
        -- Retrieve the room_id based on the designation
        SELECT *
        INTO room_record
        FROM Room r
        WHERE r.designation = designation;

        RETURN room_record;
    END READROOMBYDESIGNATION;

    PROCEDURE UpdateRoom(
        old_room_id NUMBER,
        new_room_type_id NUMBER
    ) AS
    BEGIN
        -- Update the room record based on the room number
        UPDATE Room
        SET type_id = new_room_type_id
        WHERE id = old_room_id;
    END UpdateRoom;

    PROCEDURE DeleteRoom(
        room_id NUMBER
    ) AS
    BEGIN
        -- Delete the room record based on the room number
        DELETE
        FROM Room
        WHERE id = room_id;
    END DeleteRoom;

    -- CRUD operations for ExamRole
    FUNCTION CreateExamRole(
        role_name VARCHAR2
    ) RETURN NUMBER AS
        role_id NUMBER;
    BEGIN
        -- Insert a new exam role record into the ExamRole table
        INSERT INTO ExamRole (role)
        VALUES (role_name)
        RETURNING id INTO role_id;

        RETURN role_id;
    END CreateExamRole;

    FUNCTION ReadExamRole(
        role_name VARCHAR2
    ) RETURN EXAMROLE%rowtype AS
        role_record EXAMROLE%rowtype;
    BEGIN
        -- Retrieve the role_id based on the role name
        SELECT *
        INTO role_record
        FROM ExamRole
        WHERE role = role_name;

        RETURN role_record;
    END ReadExamRole;

    PROCEDURE UpdateExamRole(
        old_role_name VARCHAR2,
        new_role_name VARCHAR2
    ) AS
    BEGIN
        -- Update the exam role record based on the old and new role names
        UPDATE ExamRole
        SET role = new_role_name
        WHERE role = old_role_name;
    END UpdateExamRole;

    PROCEDURE DeleteExamRole(
        role_name VARCHAR2
    ) AS
    BEGIN
        -- Delete the exam role record based on the role name
        DELETE
        FROM ExamRole
        WHERE role = role_name;
    END DeleteExamRole;

    -- CRUD operations for Exam
    FUNCTION CreateExam(
        title VARCHAR2,
        exam_date TIMESTAMP,
        subject_id NUMBER,
        room_id NUMBER DEFAULT NULL
    ) RETURN NUMBER AS
        exam_id NUMBER;
    BEGIN
        -- Insert a new exam record into the Exam table
        INSERT INTO Exam (title, exam_date, subject_id, room_id)
        VALUES (title, exam_date, subject_id, room_id)
        RETURNING id INTO exam_id;

        RETURN exam_id;
    END CreateExam;

    PROCEDURE UpdateExam(
        exam_id NUMBER,
        title VARCHAR2,
        exam_date TIMESTAMP,
        subject_id NUMBER,
        room_id NUMBER DEFAULT NULL
    ) AS
    BEGIN
        -- Update the exam record based on the exam ID
        UPDATE Exam
        SET title      = title,
            exam_date  = exam_date,
            subject_id = subject_id,
            room_id    = room_id
        WHERE id = exam_id;
    END UpdateExam;

    PROCEDURE DeleteExam(
        exam_id NUMBER
    ) AS
    BEGIN
        -- Delete the exam record based on the exam ID
        DELETE
        FROM Exam
        WHERE id = exam_id;
    END DeleteExam;

    -- CRUD operations for Participant
    PROCEDURE CreateParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER,
        score NUMBER DEFAULT NULL
    ) AS
    BEGIN
        -- Insert a new participant record into the Participant table
        INSERT INTO Participant (exam_id, person_id, exam_role_id, score)
        VALUES (exam_id, person_id, exam_role_id, score);
    END CreateParticipant;

    FUNCTION ReadParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER
    ) RETURN PARTICIPANT%rowtype AS
        participant_record PARTICIPANT%rowtype;
    BEGIN
        -- Fetch the score of the participant with the specified IDs
        SELECT *
        INTO participant_record
        FROM Participant p
        WHERE p.exam_id = exam_id
          AND p.person_id = person_id
          AND p.exam_role_id = exam_role_id;

        RETURN participant_record;
    END ReadParticipant;

    PROCEDURE UpdateParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER,
        score NUMBER
    ) AS
    BEGIN
        -- Update the participant record based on the exam ID, person ID, and exam role ID
        UPDATE Participant
        SET score = score
        WHERE exam_id = exam_id
          AND person_id = person_id
          AND exam_role_id = exam_role_id;
    END UpdateParticipant;

    PROCEDURE DeleteParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER
    ) AS
    BEGIN
        -- Delete the participant record based on the exam ID, person ID, and exam role ID
        DELETE
        FROM Participant p
        WHERE p.exam_id = exam_id
          AND p.person_id = person_id
          AND p.exam_role_id = exam_role_id;
    END DeleteParticipant;

    -- 1. Jährlicher Notenschnitt eines Schülers auslesen
    FUNCTION get_avg_student_grade(
        p_firstname VARCHAR2,
        p_lastname VARCHAR2,
        p_start_date DATE,
        p_end_date DATE
    ) RETURN NUMBER AS
        v_avg_grade NUMBER;
    BEGIN
        SELECT Round(AVG(p.score), 2) INTO v_avg_grade
        FROM Participant p
        JOIN Test t ON p.test_id = t.id
        JOIN Person pe ON p.person_id = pe.id
        WHERE pe.firstname = p_firstname
        AND pe.lastname = p_lastname
        AND t.TEST_DATE BETWEEN p_start_date AND p_end_date;

        RETURN v_avg_grade;
    END get_avg_student_grade;

-- 2. Prüfungsergebnisse für einen bestimmten Test anzeigen
    FUNCTION get_test_results(
        p_test_id NUMBER
    ) RETURN SYS_REFCURSOR AS
        v_result_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_result_cursor FOR
        SELECT pe.firstname || ' ' || pe.lastname AS Schüler, p.score AS Note
        FROM Participant p
        JOIN Test t ON p.test_id = t.id
        JOIN Person pe ON p.person_id = pe.id
        WHERE t.id = p_test_id
        AND p.score IS NOT NULL;

        RETURN v_result_cursor;
    END get_test_results;

-- 3. Noten aller Schüler in einer Klasse in einem bestimmten Fach (XXX)
    FUNCTION get_class_subject_grades(
        p_class_name VARCHAR2,
        p_subject_name VARCHAR2
    ) RETURN SYS_REFCURSOR AS
        v_grade_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_grade_cursor FOR
        SELECT P2.FIRSTNAME || ' ' || P2.lastname AS Schüler, AVG(p.score) AS Durchschnittsnote
        FROM Participant p
        JOIN PERSON P2 ON p.PERSON_ID = P2.ID
        JOIN CLASS C2 ON P2.CLASS_ID = C2.ID
        JOIN TEST T ON T.ID = p.TEST_ID
        JOIN SUBJECT S2 ON T.SUBJECT_ID = S2.ID
        WHERE C2.NAME = p_class_name
        AND S2.NAME = p_subject_name
        GROUP BY P2.FIRSTNAME, P2.LASTNAME;

        RETURN v_grade_cursor;
    END get_class_subject_grades;

-- 4. Die Teilnehmer eines Tests und deren Rollen
    FUNCTION get_test_participants(
        p_test_title VARCHAR2
    ) RETURN SYS_REFCURSOR AS
        v_participants_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_participants_cursor FOR
        SELECT pe.firstname || ' ' || pe.lastname AS Person, tr.role AS Rolle
        FROM Participant p
        JOIN Test t ON p.test_id = t.id
        JOIN Person pe ON p.person_id = pe.id
        JOIN TestRole tr ON p.test_role_id = tr.id
        WHERE t.title = p_test_title;

        RETURN v_participants_cursor;
    END get_test_participants;

-- 5. Alle Tests für ein bestimmtes Fach auflisten
    FUNCTION get_tests_by_subject(
        p_subject_name VARCHAR2
    ) RETURN SYS_REFCURSOR AS
        v_tests_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_tests_cursor FOR
        SELECT title AS Test
        FROM Test
        WHERE subject_id = (SELECT id FROM Subject WHERE name = p_subject_name);

        RETURN v_tests_cursor;
    END get_tests_by_subject;

-- 6. Eine Aufsichtsperson für einen bestimmten Test, mit gewisser Qualifikation
    FUNCTION get_test_supervisor(
        p_test_title VARCHAR2
    ) RETURN SYS_REFCURSOR AS
        v_supervisor_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_supervisor_cursor FOR
        SELECT pe.firstname || ' ' || pe.lastname AS Person
        FROM TEST t
        JOIN Competence c ON t.subject_id = c.subject_id
        JOIN Person pe ON c.person_id = pe.id
        WHERE t.title = p_test_title;

        RETURN v_supervisor_cursor;
    END get_test_supervisor;

-- 7. Durchschnittliche Erfolgsquote einer Klasse/Fach
    FUNCTION get_class_subject_success_rate(
        p_class_name VARCHAR2,
        p_subject_name VARCHAR2
    ) RETURN NUMBER AS
        v_avg_success_rate NUMBER;
    BEGIN
        SELECT Round(AVG(p.score), 2) INTO v_avg_success_rate
        FROM Participant p
        JOIN TEST T ON T.ID = p.TEST_ID
        JOIN SUBJECT S2 ON S2.ID = T.SUBJECT_ID
        JOIN PERSON P2 ON p.PERSON_ID = P2.ID
        JOIN CLASS C2 ON P2.CLASS_ID = C2.ID
        WHERE S2.NAME = p_subject_name
        AND C2.NAME = p_class_name;

        RETURN v_avg_success_rate;
    END get_class_subject_success_rate;


-- 8. Query to find free rooms for a specific date
    FUNCTION find_free_rooms(
        p_date DATE
    ) RETURN SYS_REFCURSOR AS
        v_free_rooms_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_free_rooms_cursor FOR
        SELECT
            r.id AS room_id,
            r.designation AS room_designation,
            rt.type AS room_type
        FROM Room r
        JOIN RoomType rt ON r.type_id = rt.id
        WHERE NOT EXISTS (
            SELECT 1
            FROM Test t
            WHERE t.room_id = r.id
              AND t.test_date >= p_date
              AND t.test_date < p_date + 1
        );

        RETURN v_free_rooms_cursor;
    END find_free_rooms;

END exams_manager;
/