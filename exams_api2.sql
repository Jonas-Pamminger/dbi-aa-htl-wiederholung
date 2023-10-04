DROP PACKAGE exams_manager;

CREATE OR REPLACE PACKAGE exams_manager AS
    FUNCTION CreateExam(
        title VARCHAR2,
        exam_date TIMESTAMP,
        examiner VARCHAR2 DEFAULT NULL,
        subject VARCHAR2,
        class VARCHAR2 DEFAULT NULL
    ) RETURN NUMBER;

    PROCEDURE AddParticipants(
        exam_id NUMBER,
        class VARCHAR2 DEFAULT NULL,
        person VARCHAR2 DEFAULT NULL,
        exam_role_id NUMBER DEFAULT NULL
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
        person VARCHAR2,
        score NUMBER
    );

    FUNCTION CalculateGradeAverage(
        class VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE ReserveRoom(
        exam_id NUMBER,
        room VARCHAR2
    );

    PROCEDURE AscendClass(
        class VARCHAR2,
        new_class_name VARCHAR2
    );
END;
/

CREATE OR REPLACE PACKAGE BODY exams_manager AS
    FUNCTION CreateExam(
    title VARCHAR2,
    exam_date TIMESTAMP,
    examiner VARCHAR2 DEFAULT NULL,
    subject VARCHAR2,
    class VARCHAR2 DEFAULT NULL
) RETURN NUMBER AS
    new_id NUMBER;
    examiner_id NUMBER;
    class_id NUMBER;
BEGIN
    -- Resolve examiner_id based on examiner_name if provided
    IF examiner IS NOT NULL THEN
        SELECT id INTO examiner_id
        FROM organisation.Person
        WHERE (firstname || ' ' || lastname) = examiner;
    ELSE
        examiner_id := NULL; -- Set examiner_id to NULL if examiner is not provided
    END IF;

    -- Resolve class_id based on class_name if provided
    IF class IS NOT NULL THEN
        SELECT id INTO class_id
        FROM organisation.Class
        WHERE name = class;
    ELSE
        class_id := NULL; -- Set class_id to NULL if class_name is not provided
    END IF;

    INSERT INTO organisation.Exam (title, exam_date, subject_id, room_id)
    VALUES (title, exam_date, (SELECT id FROM organisation.Subject WHERE name = subject), NULL)
    RETURNING id INTO new_id;

    -- If an examiner_id is provided, add the examiner as a organisation.Participant
    IF examiner_id IS NOT NULL THEN
        AddParticipants(new_id, NULL, examiner_id, NULL);
    END IF;

    -- If a class_id is provided, add the organisation.Class as a organisation.Participant
    IF class_id IS NOT NULL THEN
        AddParticipants(new_id, class_id, NULL, NULL);
    END IF;

        -- Return the test_id
        RETURN new_id;
    END CreateExam;

    PROCEDURE AddParticipants(
        exam_id NUMBER,
        class VARCHAR2 DEFAULT NULL,
        person VARCHAR2 DEFAULT NULL,
        exam_role_id NUMBER DEFAULT NULL
    ) IS
        class_id NUMBER;
        person_id NUMBER;
    BEGIN
        SELECT id INTO class_id FROM organisation.Class WHERE name = class;
        IF class_id IS NOT NULL THEN
            INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id)
            SELECT exam_id, person_id, exam_role_id
            FROM organisation.Person p
            WHERE p.class_id = class;
        END IF;

        SELECT id INTO person_id FROM organisation.Person WHERE (firstname || ' ' || lastname) = person;
        IF person_id IS NOT NULL THEN
            INSERT INTO organisation.Participant (exam_id, person_id, exam_role_id)
            VALUES (exam_id, person_id, exam_role_id);
        END IF;
    END AddParticipants;

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
        room_id NUMBER;
    BEGIN
        SELECT r.id INTO room_id
        FROM organisation.Room r
                 JOIN organisation.RoomType rt ON r.type_id = rt.id
        WHERE NOT EXISTS (
            SELECT 1
            FROM organisation.Exam t
            WHERE t.room_id = r.id
              AND t.exam_date >= exam_date -- Use the parameter directly, no need to use TO_DATE
              AND t.exam_date < exam_date + INTERVAL '1' DAY
        );

        RETURN room_id;
    END FindAvailableRoom;

    PROCEDURE GradeStudent(
        exam_id NUMBER,
        person VARCHAR2,
        score NUMBER
    ) AS
        person_id NUMBER;
    BEGIN
        SELECT id INTO person_id FROM organisation.Person WHERE (firstname || ' ' || lastname) = person;
        -- Insert the student's score into the Participant table
        UPDATE organisation.Participant p
        SET score = score
        WHERE p.exam_id = exam_id AND p.person_id = person_id;
    END GradeStudent;

    FUNCTION CalculateGradeAverage(
        class VARCHAR2
    ) RETURN NUMBER AS
        avg_score NUMBER;
    BEGIN
        RETURN 0;
    END CalculateGradeAverage;

    PROCEDURE ReserveRoom(
        exam_id NUMBER,
        room VARCHAR2
    ) AS
        room_id NUMBER;
    BEGIN
        SELECT id INTO room_id FROM organisation.Room where designation = room;
        -- Update the Exam record to set the room_id
        UPDATE organisation.Exam
        SET room_id = room_id
        WHERE id = exam_id;
    END ReserveRoom;

    PROCEDURE AscendClass(
        class VARCHAR2,
        new_class_name VARCHAR2
    ) AS
        class_id NUMBER;
    BEGIN
        SELECT id INTO class_id FROM organisation.Class WHERE name = class;
        -- Update the Class record to change the class name
        UPDATE organisation.Class
        SET name = new_class_name
        WHERE id = class_id;
    END AscendClass;
END exams_manager;
/