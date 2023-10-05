CREATE OR REPLACE PACKAGE exams_manager AS
    -- Hinzufügen weiterer Teilnehmer: Eine Klasse, ein einzelner Schüler oder eine weitere Rolle (zB.: Aufsichtsperson) können zu einem Test ergänzt werden
    PROCEDURE AddParticipants(
        exam_id organisation.Exam.id%TYPE,
        class_Id organisation.Class.id%type DEFAULT NULL,
        person_id organisation.Person.id%type DEFAULT NULL,
        exam_role_id organisation.ExamRole.id%type DEFAULT NULL
    );

    -- Find-Replacement: Bei Verhinderung des vorherigen Prüfers wird ein Ersatz-Prüfer mit den nötigen Kompetenzen gesucht, und falls verfügbar, eingetragen
    FUNCTION FindReplacementExaminer(
        exam_id organisation.Exam.id%TYPE
    ) RETURN organisation.Person%rowtype;

    -- Find-Available-organisation.Room: Finde einen Raum mit einer entsprechenden Raumart
    FUNCTION FindAvailableRoom(
        room_type organisation.RoomType.id%type,
        exam_date organisation.Exam.exam_date%type
    ) RETURN NUMBER;

    -- Grade-Student: Trage für einen Schüler eine Note ein
    PROCEDURE GradeStudent(
        exam_id organisation.Exam.id%TYPE,
        person_id organisation.Person.id%type,
        score NUMBER
    );

    -- Calculate-Grade-Average: Berechne für einen Schüler den Notendurchschnitt
    FUNCTION CalculateGradeAverage(
        student_id organisation.Person.id%type
    ) RETURN NUMBER;

    -- Print-Test-Results: Drucke die Ergebnisse eines Tests
    FUNCTION GetTestResults(
        exam_id organisation.Exam.id%TYPE
    ) Return SYS_REFCURSOR;

    -- Print-Test-Results-For-organisation.Class-And-organisation.Subject: Drucke die Ergebnisse eines Tests für eine Klasse und ein Fach
    FUNCTION GetAverageTestResultsForSupjectsAndClass(
        class_name organisation.Class.name%type,
        subject_name organisation.Subject.name%type
    ) RETURN SYS_REFCURSOR;

    FUNCTION GetTestParticipantsAndRoles(
        examTitle organisation.Exam.TITLE%TYPE
    ) RETURN SYS_REFCURSOR;

    FUNCTION GetAllTestForSubject(
        subject_name organisation.Subject.name%type
    ) RETURN organisation.Exam%rowtype;

    FUNCTION FindSupervisorForTest(
        exam_id organisation.Exam.id%TYPE
    ) RETURN organisation.PersonWithID;

    FUNCTION GetSuccessRateForClassAndTest(
        class_name organisation.Class.name%type,
        subject_name organisation.Subject.name%type
    ) RETURN NUMBER;

    -- Reserve-organisation.Room: Trage zum Test einen Raum ein, falls frei
    PROCEDURE ReserveRoom(
        exam_id organisation.Exam.id%TYPE,
        room_id organisation.Room.id%type
    );

    -- Ascend-organisation.Class: Erhöhe die Schulstufe der Klasse
    PROCEDURE AscendClass(
        class_Id organisation.Class.id%type,
        new_class_name organisation.Class.name%type
    );

    FUNCTION CreateExam(
        title organisation.Exam.title%type,
        exam_date organisation.Exam.exam_date%type,
        examiner_id organisation.Person.id%type DEFAULT NULL,
        subject_id organisation.Subject.id%type,
        class_Id organisation.Class.id%type DEFAULT NULL
    ) RETURN NUMBER;

    -- CRUD for organisation.Subject
    FUNCTION CreateSubject(
        subjectName VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadSubject(
        subjectName VARCHAR2
    ) RETURN organisation.Subject%rowtype;

    PROCEDURE UpdateSubject(
        old_name VARCHAR2,
        new_name VARCHAR2
    );

    PROCEDURE DeleteSubject(
        subjectName VARCHAR2
    );

    -- CRUD for organisation.Class
    FUNCTION CreateClass(
        className VARCHAR2,
        subject_id organisation.Subject.id%type
    ) RETURN NUMBER;

    FUNCTION ReadClass(
        className VARCHAR2
    ) RETURN organisation.Class%rowtype;

    PROCEDURE UpdateClass(
        old_name VARCHAR2,
        new_name VARCHAR2,
        subject_id organisation.Subject.id%type
    );

    PROCEDURE DeleteClass(
        className VARCHAR2
    );

    -- CRUD for organisation.Person
    FUNCTION CreatePerson(
        new_first_name VARCHAR2,
        new_last_name VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadPerson(
        r_first_name VARCHAR2,
        r_last_name VARCHAR2
    ) RETURN organisation.Person%rowtype;

    PROCEDURE UpdatePerson(
        old_first_name VARCHAR2,
        old_last_name VARCHAR2,
        new_first_name VARCHAR2,
        new_last_name VARCHAR2
    );

    PROCEDURE DeletePerson(
        del_first_name VARCHAR2,
        del_last_name VARCHAR2
    );

    -- CRUD for organisation.Competence
    FUNCTION CreateCompetence(
        com_description VARCHAR2
    ) RETURN NUMBER;

    FUNCTION CreateCompetenceWithPerson(
        com_description VARCHAR2,
        com_person_id organisation.Person.id%type
    ) RETURN NUMBER;

    FUNCTION CreateCompetenceWithPersonAndSubject(
        com_description VARCHAR2,
        com_person_id organisation.Person.id%type,
        com_subject_id organisation.Subject.id%type
    ) RETURN NUMBER;

    FUNCTION ReadCompetence(
        com_description VARCHAR2
    ) RETURN organisation.Competence%rowtype;

    PROCEDURE UpdateCompetence(
        old_description VARCHAR2,
        new_description VARCHAR2,
        com_person_id organisation.Person.id%type,
        com_subject_id organisation.Subject.id%type
    );

    PROCEDURE DeleteCompetence(
        com_description VARCHAR2
    );

    -- CRUD for organisation.RoomType
    FUNCTION CreateRoomType(
        room_type organisation.RoomType.id%type
    ) RETURN NUMBER;

    PROCEDURE UpdateRoomType(
        old_room_type organisation.RoomType.id%type,
        new_room_type organisation.RoomType.id%type
    );

    PROCEDURE DeleteRoomType(
        room_type organisation.RoomType.id%type
    );

    -- CRUD for organisation.Room
    FUNCTION CreateRoom(
        room_designation VARCHAR2,
        room_type_id NUMBER
    ) RETURN NUMBER;

    FUNCTION ReadRoomByDesignation(
        room_designation VARCHAR2
    ) RETURN organisation.Room%rowtype;

    PROCEDURE DeleteRoom(
        room_id organisation.Room.id%type
    );

    -- CRUD for organisation.ExamRole
    FUNCTION CreateExamRole(
        role_name VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadExamRole(
        role_name VARCHAR2
    ) RETURN organisation.ExamRole%rowtype;

    PROCEDURE UpdateExamRole(
        old_role_name VARCHAR2,
        new_role_name VARCHAR2
    );

    PROCEDURE DeleteExamRole(
        role_name VARCHAR2
    );


    PROCEDURE UpdateExam(
        ex_id NUMBER,
        ex_title organisation.Exam.title%type,
        ex_date TIMESTAMP,
        ex_subject_id organisation.Subject.id%type,
        ex_room_id organisation.Room.id%type DEFAULT NULL
    );

    PROCEDURE DeleteExam(
        ex_id NUMBER
    );
END exams_manager;
/

CREATE OR REPLACE PACKAGE BODY exams_manager AS

    PROCEDURE AddParticipants(
        exam_id organisation.Exam.id%TYPE,
        class_Id organisation.Class.id%type DEFAULT NULL,
        person_id organisation.Person.id%type DEFAULT NULL,
        exam_role_id organisation.ExamRole.id%type DEFAULT NULL
    ) AS
    BEGIN
        -- Insert participant records into the organisation.Participant table based on parameters
        IF class_id IS NOT NULL THEN
            INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id)
            SELECT exam_id, person_id, exam_role_id
            FROM organisation.Person
            WHERE class_id = class_id;
        END IF;

        IF person_id IS NOT NULL THEN
            INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id)
            VALUES (exam_id, person_id, exam_role_id);
        END IF;
    END AddParticipants;

    FUNCTION FindReplacementExaminer(
        exam_id organisation.Exam.id%TYPE
    ) RETURN organisation.Person%rowtype AS
        new_examiner organisation.Person%rowtype;
    BEGIN
        Select *
        into new_examiner
        from organisation.Person
        where id = (SELECT pe.id
                    FROM organisation.Exam t
                             JOIN organisation.Competence c ON t.subject_id = c.subject_id
                             JOIN organisation.Person pe ON c.person_id = pe.id
                    WHERE t.id = exam_id);

        RETURN new_examiner;
    END FindReplacementExaminer;

    FUNCTION FindAvailableRoom(
        room_type organisation.RoomType.id%type,
        exam_date organisation.Exam.exam_date%type
    ) RETURN NUMBER AS
        room_id organisation.Room.id%type;
    BEGIN
        SELECT r.id
        INTO room_id
        FROM organisation.Room r
                 JOIN organisation.RoomType rt ON r.type_id = rt.id
        WHERE NOT EXISTS (SELECT 1
                          FROM organisation.Exam t
                          WHERE t.room_id = r.id
                            AND t.exam_date >= exam_date -- Use the parameter directly, no need to use TO_DATE
                            AND t.exam_date < exam_date + INTERVAL '1' DAY);

        RETURN room_id;
    END FindAvailableRoom;

    PROCEDURE GradeStudent(
        exam_id organisation.Exam.id%TYPE,
        person_id organisation.Person.id%type,
        score NUMBER
    ) AS
    BEGIN
        -- Insert the student's score into the organisation.Participant table
        UPDATE organisation.Participant
        SET score = score
        WHERE exam_id = exam_id
          AND person_id = person_id;
    END GradeStudent;

    FUNCTION CalculateGradeAverage(
        student_id organisation.Person.id%type
    ) RETURN NUMBER AS
        avg_score NUMBER;
    BEGIN
        SELECT Round(AVG(p.score), 2)
        INTO avg_score
        FROM organisation.Participant p
                 JOIN organisation.Exam t ON p.exam_id = t.id
                 JOIN organisation.Person pe ON p.person_id = pe.id
        WHERE pe.id = student_id
          AND t.EXAM_DATE BETWEEN TO_TIMESTAMP('2023-09-11 10:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_TIMESTAMP('2024-09-11 11:00:00', 'YYYY-MM-DD HH24:MI:SS');

        RETURN avg_score;
    END CalculateGradeAverage;

    FUNCTION GetTestResults(
        exam_id organisation.Exam.id%TYPE
    ) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT organisation.TestResultType(pe.firstname, pe.lastname, p.score)
            FROM organisation.Participant p
                     JOIN organisation.Exam t ON p.exam_id = t.id
                     JOIN organisation.Person pe ON p.person_id = pe.id
            WHERE t.id = exam_id
              AND p.score IS NOT NULL;

        RETURN cur;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END GetTestResults;

    FUNCTION GetAverageTestResultsForSubjectsAndClass(
        class_name organisation.Class.name%type,
        subject_name organisation.Subject.name%type
    ) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT organisation.TestResultType(P2.FIRSTNAME, P2.LASTNAME, AVG(p.score))
            FROM organisation.Participant p
                     JOIN organisation.Person P2 ON p.PERSON_ID = P2.ID
                     JOIN organisation.Class C2 ON P2.CLASS_ID = C2.ID
                     JOIN organisation.Exam T ON T.ID = p.exam_id
                     JOIN organisation.Subject S2 ON T.SUBJECT_ID = S2.ID
            WHERE C2.NAME = class_name
              AND S2.NAME = subject_name
            GROUP BY P2.FIRSTNAME, P2.LASTNAME;

        RETURN cur;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END GetAverageTestResultsForSubjectsAndClass;


    FUNCTION GetTestParticipantsAndRoles(
        examTitle organisation.Exam.TITLE%TYPE
    ) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT organisation.PersonRoleType(pe.firstname, pe.lastname, tr.role)
            FROM organisation.Participant p
                     JOIN organisation.Exam t ON p.exam_id = t.id
                     JOIN organisation.Person pe ON p.person_id = pe.id
                     JOIN organisation.ExamRole tr ON p.EXAM_ROLE_ID = tr.id
            WHERE t.title = examTitle;

        RETURN cur;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END GetTestParticipantsAndRoles;

    FUNCTION GetAllTestForSubject(subject_name organisation.Subject.name%type) RETURN organisation.Exam%rowtype IS
        exam_row organisation.Exam%rowtype;
    BEGIN
        SELECT *
        INTO exam_row
        FROM organisation.Exam
        WHERE subject_id = (SELECT id FROM organisation.Subject WHERE name = subject_name);

        RETURN exam_row;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL; -- Handle the case when no data is found for the subject.
    END GetAllTestForSubject;

    FUNCTION FindSupervisorForTest(exam_id organisation.Exam.id%TYPE) RETURN organisation.PersonWithID IS
        supervisor organisation.PersonWithID;
    BEGIN
        SELECT organisation.PersonWithID(pe.firstname, pe.lastname, pe.id)
        INTO supervisor
        FROM organisation.Exam t
                 JOIN organisation.Competence c ON t.subject_id = c.subject_id
                 JOIN organisation.Person pe ON c.person_id = pe.id
        WHERE t.id = exam_id;

        RETURN supervisor;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL; -- Handle the case when no supervisor is found for the test.
    END FindSupervisorForTest;

    FUNCTION GetSuccessRateForClassAndTest(
        class_name organisation.Class.name%type,
        subject_name organisation.Subject.name%type
    ) RETURN NUMBER IS
        success_rate NUMBER;
    BEGIN
        SELECT Round(AVG(p.score), 2)
        INTO success_rate
        FROM organisation.Participant p
                 JOIN organisation.Exam T ON T.ID = p.exam_id
                 JOIN organisation.Subject S2 ON S2.ID = T.SUBJECT_ID
                 JOIN organisation.Person P2 ON p.PERSON_ID = P2.ID
                 JOIN organisation.Class C2 ON P2.CLASS_ID = C2.ID
        WHERE s2.NAME =  subject_name AND C2.NAME = class_name;

        RETURN success_rate;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL; -- Handle the case when no data is found for the specified class and test.
    END GetSuccessRateForClassAndTest;

    FUNCTION GetAllTestForSupject(
        subject_name organisation.Subject.name%type
    ) RETURN organisation.Exam%ROWTYPE AS
        exams organisation.Exam%ROWTYPE;
    BEGIN
        SELECT * INTO exams
        FROM organisation.Exam
        WHERE subject_id = (SELECT id FROM organisation.Subject WHERE name = subject_name);
    End GetAllTestForSupject;


    PROCEDURE
        ReserveRoom(
        exam_id organisation.Exam.id%TYPE,
        room_id organisation.Room.id%type
    ) AS
    BEGIN
        -- Update the organisation.Exam record to set the room_id
        UPDATE organisation.Exam
        SET room_id = room_id
        WHERE id = exam_id;
    END ReserveRoom;

    PROCEDURE
        AscendClass(
        class_Id organisation.Class.id%type,
        new_class_name organisation.Class.name%type
    ) AS
    BEGIN
        -- Update the organisation.Class record to change the class name
        UPDATE organisation.Class
        SET name = new_class_name
        WHERE id = class_id;
    END AscendClass;

    FUNCTION
        CreateExam(
        title organisation.Exam.title%type,
        exam_date organisation.Exam.exam_date%type,
        examiner_id organisation.Person.id%type DEFAULT NULL,
        subject_id organisation.Subject.id%type,
        class_Id organisation.Class.id%type DEFAULT NULL
    )
        RETURN NUMBER AS
        exam_id organisation.Exam.id%TYPE;
    BEGIN
        -- Insert the test record into the organisation.Exam table
        INSERT INTO organisation.Exam (title, exam_date, subject_id)
        VALUES (title, exam_date, subject_id)
        RETURNING id INTO exam_id;

        -- If an examiner_id is provided, add the examiner as a participant
        IF examiner_id IS NOT NULL THEN
            AddParticipants(exam_id, NULL, examiner_id, 1);
        END IF;

        -- If a class_id is provided, add the class as a participant
        IF class_id IS NOT NULL THEN
            AddParticipants(exam_id, class_id, NULL, NULL);
        END IF;

        -- Return the exam_id
        RETURN exam_id;
    END CreateExam;

    -- CRUD operations for organisation.Subject, organisation.Class, organisation.Person, organisation.Competence, organisation.RoomType, organisation.Room, organisation.ExamRole, organisation.Exam, and organisation.Participant go here

    -- CRUD operations for organisation.Subject
    FUNCTION
        CreateSubject(
        subjectName VARCHAR2
    )
        RETURN NUMBER AS
        subject_id organisation.Subject.id%type;
    BEGIN
        -- Insert a new subject record into the organisation.Subject table
        INSERT INTO organisation.Subject (name)
        VALUES (subjectName)
        RETURNING id INTO subject_id;

        RETURN subject_id;
    END CreateSubject;

    FUNCTION
        ReadSubject(
        subjectName VARCHAR2
    )
        RETURN organisation.Subject % ROWTYPE AS
        subject_record organisation.Subject%ROWTYPE;
    BEGIN
        -- Retrieve the subject record based on the subject name
        SELECT *
        INTO subject_record
        FROM organisation.Subject s
        WHERE s.name = subjectName;

        RETURN subject_record;
    END ReadSubject;


    PROCEDURE
        UpdateSubject(
        old_name VARCHAR2,
        new_name VARCHAR2
    ) AS
    BEGIN
        -- Update the subject record based on the old name and new name
        UPDATE organisation.Subject
        SET name = new_name
        WHERE name = old_name;
    END UpdateSubject;

    PROCEDURE
        DeleteSubject(
        subjectName VARCHAR2
    ) AS
    BEGIN
        -- Delete the subject record based on the subject name
        DELETE
        FROM organisation.Subject
        WHERE name = subjectName;
    END DeleteSubject;

    -- CRUD operations for organisation.Class
    FUNCTION
        CreateClass(
        className VARCHAR2,
        subject_id organisation.Subject.id%type
    )
        RETURN NUMBER AS
        class_Id organisation.Class.id%type;
    BEGIN
        -- Insert a new class record into the organisation.Class table
        INSERT INTO organisation.Class (name, id)
        VALUES (className, subject_id)
        RETURNING id INTO class_id;

        RETURN class_id;
    END CreateClass;

    FUNCTION
        ReadClass(
        className VARCHAR2
    )
        RETURN organisation.Class % rowtype AS
        class_record organisation.Class%rowtype;
    BEGIN
        -- Retrieve the class_id based on the class name
        SELECT *
        INTO class_record
        FROM organisation.Class
        WHERE name = className;

        RETURN class_record;
    END ReadClass;

    PROCEDURE
        UpdateClass(
        old_name VARCHAR2,
        new_name VARCHAR2,
        subject_id organisation.Subject.id%type
    ) AS
    BEGIN
        -- Update the class record based on the old name
        UPDATE organisation.Class
        SET name = new_name,
            id   = subject_id
        WHERE name = old_name;
    END UpdateClass;

    PROCEDURE
        DeleteClass(
        className VARCHAR2
    ) AS
    BEGIN
        -- Delete the class record based on the class name
        DELETE
        FROM organisation.Class
        WHERE name = className;
    END DeleteClass;

    -- CRUD operations for organisation.Person
    FUNCTION
        CreatePerson(
        new_first_name VARCHAR2,
        new_last_name VARCHAR2
    )
        RETURN NUMBER AS
        person_id organisation.Person.id%type;
    BEGIN
        -- Insert a new person record into the organisation.Person table
        INSERT INTO organisation.Person (firstname, lastname)
        VALUES (new_first_name, new_last_name)
        RETURNING id INTO person_id;

        RETURN person_id;
    END CreatePerson;

    FUNCTION
        ReadPerson(
        r_first_name VARCHAR2,
        r_last_name VARCHAR2
    )
        RETURN organisation.Person % rowtype AS
        person_record organisation.Person%rowtype;
    BEGIN
        -- Retrieve the person_id based on the first name and last name
        SELECT *
        INTO person_record
        FROM organisation.Person p
        WHERE p.firstname = r_first_name
          AND p.lastname = r_last_name;

        RETURN person_record;
    END ReadPerson;

    PROCEDURE
        UpdatePerson(
        old_first_name VARCHAR2,
        old_last_name VARCHAR2,
        new_first_name VARCHAR2,
        new_last_name VARCHAR2
    ) AS
    BEGIN
        -- Update the person record based on the first name and last name
        UPDATE organisation.Person
        SET firstname = new_first_name,
            lastname  = new_last_name
        WHERE firstname = old_first_name
          AND lastname = old_last_name;
    END UpdatePerson;

    PROCEDURE
        DeletePerson(
        del_first_name VARCHAR2,
        del_last_name VARCHAR2
    ) AS
    BEGIN
        -- Delete the person record based on the first name and last name
        DELETE
        FROM organisation.Person
        WHERE firstname = del_first_name
          AND lastname = del_last_name;
    END DeletePerson;

    -- CRUD operations for organisation.Competence
    FUNCTION
        CreateCompetence(
        com_description VARCHAR2
    )
        RETURN NUMBER AS
        competence_id NUMBER;
    BEGIN
        -- Insert a new competence record into the organisation.Competence table
        INSERT INTO organisation.Competence (description)
        VALUES (com_description)
        RETURNING id INTO competence_id;

        RETURN competence_id;
    END CreateCompetence;

    FUNCTION
        CreateCompetenceWithPerson(
        com_description VARCHAR2,
        com_person_id organisation.Person.id%type
    )
        RETURN NUMBER AS
        competence_id NUMBER;
    BEGIN
        -- Insert a new competence record into the organisation.Competence table with a person_id
        INSERT INTO organisation.Competence (description, person_id)
        VALUES (com_description, com_person_id)
        RETURNING id INTO competence_id;

        RETURN competence_id;
    END CreateCompetenceWithPerson;

    FUNCTION
        CREATECOMPETENCEWITHPERSONANDSUBJECT(
        com_description VARCHAR2,
        com_person_id organisation.Person.id%type,
        com_subject_id organisation.Subject.id%type
    )
        RETURN NUMBER AS
        competence_id NUMBER;
    BEGIN
        -- Insert a new competence record into the organisation.Competence table with person_id and subject_id
        INSERT INTO organisation.Competence (description, person_id, subject_id)
        VALUES (com_description, com_person_id, com_subject_id)
        RETURNING id INTO competence_id;

        RETURN competence_id;
    END CREATECOMPETENCEWITHPERSONANDSUBJECT;

    FUNCTION
        ReadCompetence(
        com_description VARCHAR2
    )
        RETURN organisation.Competence % rowtype AS
        competence_record organisation.Competence%rowtype;
    BEGIN
        -- Retrieve the competence_id based on the description
        SELECT *
        INTO competence_record
        FROM organisation.Competence c
        WHERE c.description = com_description;

        RETURN competence_record;
    END ReadCompetence;

    PROCEDURE
        UpdateCompetence(
        old_description VARCHAR2,
        new_description VARCHAR2,
        com_person_id organisation.Person.id%type,
        com_subject_id organisation.Subject.id%type
    ) AS
    BEGIN
        -- Update the competence record based on the description, person_id, and subject_id
        UPDATE organisation.Competence
        SET person_id   = com_person_id,
            subject_id  = com_subject_id,
            description = new_description
        WHERE description = old_description;
    END UpdateCompetence;

    PROCEDURE
        DeleteCompetence(
        com_description VARCHAR2
    ) AS
    BEGIN
        -- Delete the competence record based on the description
        DELETE
        FROM organisation.Competence
        WHERE description = com_description;
    END DeleteCompetence;

    -- CRUD operations for organisation.RoomType
    FUNCTION
        CreateRoomType(
        room_type organisation.RoomType.id%type
    )
        RETURN NUMBER AS
        room_type_id NUMBER;
    BEGIN
        -- Insert a new room type record into the organisation.RoomType table
        INSERT INTO organisation.RoomType (room_type)
        VALUES (room_type)
        RETURNING id INTO room_type_id;

        RETURN room_type_id;
    END CreateRoomType;

    PROCEDURE
        UpdateRoomType(
        old_room_type organisation.RoomType.id%type,
        new_room_type organisation.RoomType.id%type
    ) AS
    BEGIN
        -- Update the room type record based on the room type
        UPDATE organisation.RoomType
        SET room_type = new_room_type
        WHERE room_type = old_room_type;
    END UpdateRoomType;

    PROCEDURE
        DeleteRoomType(
        room_type organisation.RoomType.id%type
    ) AS
    BEGIN
        -- Delete the room type record based on the room type
        DELETE
        FROM organisation.RoomType r
        WHERE r.room_type = room_type;
    END DeleteRoomType;

    -- CRUD operations for organisation.Room
    FUNCTION
        CreateRoom(
        room_designation VARCHAR2,
        room_type_id NUMBER
    )
        RETURN NUMBER AS
        room_id organisation.Room.id%type;
    BEGIN
        -- Insert a new room record into the organisation.Room table
        INSERT INTO organisation.Room (designation, type_id)
        VALUES (room_designation, room_type_id)
        RETURNING id INTO room_id;

        RETURN room_id;
    END CreateRoom;

    FUNCTION
        READROOMBYDESIGNATION(
        room_designation VARCHAR2
    )
        RETURN organisation.Room % rowtype AS
        room_record organisation.Room%rowtype;
    BEGIN
        -- Retrieve the room_id based on the designation
        SELECT *
        INTO room_record
        FROM organisation.Room r
        WHERE r.designation = room_designation;

        RETURN room_record;
    END READROOMBYDESIGNATION;

    PROCEDURE
        DeleteRoom(
        room_id organisation.Room.id%type
    ) AS
    BEGIN
        -- Delete the room record based on the room number
        DELETE
        FROM organisation.Room
        WHERE id = room_id;
    END DeleteRoom;

    -- CRUD operations for organisation.ExamRole
    FUNCTION
        CreateExamRole(
        role_name VARCHAR2
    )
        RETURN NUMBER AS
        role_id NUMBER;
    BEGIN
        -- Insert a new exam role record into the organisation.ExamRole table
        INSERT INTO organisation.ExamRole (role)
        VALUES (role_name)
        RETURNING id INTO role_id;

        RETURN role_id;
    END CreateExamRole;

    FUNCTION
        ReadExamRole(
        role_name VARCHAR2
    )
        RETURN organisation.ExamRole % rowtype AS
        role_record organisation.ExamRole%rowtype;
    BEGIN
        -- Retrieve the role_id based on the role name
        SELECT *
        INTO role_record
        FROM organisation.ExamRole
        WHERE role = role_name;

        RETURN role_record;
    END ReadExamRole;

    PROCEDURE
        UpdateExamRole(
        old_role_name VARCHAR2,
        new_role_name VARCHAR2
    ) AS
    BEGIN
        -- Update the exam role record based on the old and new role names
        UPDATE organisation.ExamRole
        SET role = new_role_name
        WHERE role = old_role_name;
    END UpdateExamRole;

    PROCEDURE
        DeleteExamRole(
        role_name VARCHAR2
    ) AS
    BEGIN
        -- Delete the exam role record based on the role name
        DELETE
        FROM organisation.ExamRole
        WHERE role = role_name;
    END DeleteExamRole;



    PROCEDURE
        UpdateExam(
        ex_id NUMBER,
        ex_title organisation.Exam.title%type,
        ex_date TIMESTAMP,
        ex_subject_id organisation.Subject.id%type,
        ex_room_id organisation.Room.id%type DEFAULT NULL
    ) AS
    BEGIN
        -- Update the exam record based on the exam ID
        UPDATE organisation.Exam
        SET title      = ex_title,
            exam_date  = ex_date,
            subject_id = ex_subject_id,
            room_id    = ex_room_id
        WHERE id = ex_id;
    END UpdateExam;

    PROCEDURE
        DeleteExam(
        ex_id NUMBER
    ) AS
    BEGIN
        -- Delete the exam record based on the exam ID
        DELETE
        FROM organisation.Exam
        WHERE id = ex_id;
    END DeleteExam;

END exams_manager; /