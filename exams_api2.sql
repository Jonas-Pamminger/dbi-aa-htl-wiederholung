CREATE OR REPLACE PACKAGE exams_manager AS
    FUNCTION CreateExam(
        title VARCHAR2,
        exam_date TIMESTAMP,
        examiner_name VARCHAR2 DEFAULT NULL,
        subject_name VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE AddParticipant(
        exam_id NUMBER,
        person_name VARCHAR2 DEFAULT NULL,
        exam_role VARCHAR2 DEFAULT 'Schüler'
    );

    FUNCTION FindReplacementExaminer(
        exam_id NUMBER
    ) RETURN NUMBER;

    FUNCTION FindAvailableRoom(
        room_type VARCHAR2,
        exam_date TIMESTAMP
    ) RETURN NUMBER;

    PROCEDURE GradeStudent(
        exam_id NUMBER,
        person_name VARCHAR2,
        score NUMBER
    );

    FUNCTION CalculateGradeAverage(
        student_id organisation.Person.id%type
    ) RETURN NUMBER;

    FUNCTION ReserveRoom(
        exam_id organisation.Exam.id%type,
        room_id organisation.Room.id%type
    ) RETURN organisation.Room.id%type;

    PROCEDURE AscendClass(
        class_id organisation.Class.id%type,
        new_class_name organisation.Class.name%type
    );
END;
/

CREATE OR REPLACE PACKAGE BODY exams_manager AS
    FUNCTION CreateExam(
    title VARCHAR2,
    exam_date TIMESTAMP,
    examiner_name VARCHAR2 DEFAULT NULL,
    subject_name VARCHAR2
) RETURN NUMBER AS
    new_id NUMBER;
    examiner_id NUMBER;
BEGIN
    IF examiner_name IS NOT NULL THEN
        SELECT id INTO examiner_id
        FROM organisation.Person
        WHERE (firstname || ' ' || lastname) = examiner_name;
    ELSE
        examiner_id := NULL;
    END IF;

    INSERT INTO organisation.Exam (title, exam_date, subject_id, room_id)
    VALUES (title, exam_date, (SELECT id FROM organisation.Subject WHERE name = subject_name), NULL)
    RETURNING id INTO new_id;

    IF examiner_id IS NOT NULL THEN
        AddParticipant(new_id, examiner_name);
    END IF;

    RETURN new_id;
    END CreateExam;

    PROCEDURE AddParticipant(
        exam_id NUMBER,
        person_name VARCHAR2 DEFAULT NULL,
        exam_role VARCHAR2 DEFAULT 'Schüler'
    ) IS
        person_id NUMBER;
        exam_role_id NUMBER;
    BEGIN
        SELECT id INTO person_id FROM organisation.Person WHERE (firstname || ' ' || lastname) = person_name;
        SELECT id INTO exam_role_id FROM organisation.ExamRole WHERE role = exam_role;
        IF person_id IS NOT NULL AND exam_role_id IS NOT NULL THEN
            INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id)
            VALUES (exam_id, person_id, exam_role_id);
        END IF;
    END AddParticipant;

    FUNCTION FindReplacementExaminer(
        exam_id NUMBER
    ) RETURN NUMBER AS
        Examiner NUMBER;
    BEGIN
        SELECT pe.id INTO Examiner
        FROM organisation.Exam t
                 JOIN organisation.Competence c ON t.subject_id = c.subject_id
                 JOIN organisation.Person pe ON c.person_id = pe.id
        WHERE t.id = exam_id;

        RETURN Examiner;
    END FindReplacementExaminer;

    FUNCTION FindAvailableRoom(
        room_type VARCHAR2,
        exam_date TIMESTAMP
    ) RETURN NUMBER AS
        room_type_id NUMBER;
        room_id NUMBER;
    BEGIN
        SELECT id INTO room_type_id FROM organisation.RoomType WHERE type = room_type;
        SELECT r.id INTO room_id
        FROM organisation.Room r
                 JOIN organisation.RoomType rt ON r.type_id = rt.id
        WHERE NOT EXISTS (
            SELECT 1
            FROM organisation.Exam t
            WHERE t.room_id = r.id AND r.type_id = room_type_id
              AND t.exam_date >= exam_date
              AND t.exam_date < exam_date + INTERVAL '1' DAY
        );

        RETURN room_id;
    END FindAvailableRoom;

    PROCEDURE GradeStudent(
        exam_id NUMBER,
        person_name VARCHAR2,
        score NUMBER
    ) AS
        person_id NUMBER;
    BEGIN
        SELECT id INTO person_id FROM organisation.Person WHERE (firstname || ' ' || lastname) = person_name;
        -- Insert the student's score into the Participant table
        UPDATE organisation.Participant p
        SET p.score = score
        WHERE p.exam_id = exam_id AND p.person_id = person_id;
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

    FUNCTION ReserveRoom(
        exam_id organisation.Exam.id%type,
        room_id organisation.Room.id%type
    ) RETURN organisation.Room.id%type AS
        res_room_id organisation.Room.id%type;
    BEGIN
        UPDATE organisation.Exam
        SET room_id = room_id
        WHERE id = exam_id RETURNING id INTO res_room_id;

        RETURN res_room_id;
    END ReserveRoom;

    PROCEDURE AscendClass(
        class_id organisation.Class.id%type,
        new_class_name organisation.Class.name%type
    ) AS
    BEGIN
        UPDATE organisation.Class
        SET name = new_class_name
        WHERE id = class_id;
    END AscendClass;
END exams_manager;
/