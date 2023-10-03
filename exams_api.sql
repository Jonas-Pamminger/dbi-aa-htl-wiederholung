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
    ) RETURN SYS_REFCURSOR;

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
        new_class_name VARCHAR2(100)
    );

    -- CRUD for Subject
    FUNCTION CreateSubject(
        name VARCHAR2) RETURN NUMBER;

    FUNCTION ReadSubject(
        name VARCHAR2) RETURN NUMBER;

    PROCEDURE UpdateSubject(
        name VARCHAR2);

    PROCEDURE DeleteSubject(
        name VARCHAR2);

    -- CRUD for Class
    FUNCTION CreateClass(
        name VARCHAR2,
        subject_id NUMBER) RETURN NUMBER;

    FUNCTION ReadClass(
        name VARCHAR2) RETURN Number;

    PROCEDURE UpdateClass(
        name VARCHAR2,
        subject_id NUMBER);

    PROCEDURE DeleteClass(
        name VARCHAR);

    -- CRUD for Person
    FUNCTION CreatePerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadPerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE UpdatePerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    );

    PROCEDURE DeletePerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    );

    -- CRUD for Competence
    FUNCTION CreateCompetence(
        description VARCHAR2
    ) RETURN NUMBER;

    FUNCTION CreateCompetence(
        description VARCHAR2,
        person_id NUMBER
    ) RETURN NUMBER;

    FUNCTION CreateCompetence(
        description VARCHAR2,
        person_id NUMBER,
        subject_id NUMBER
    ) RETURN NUMBER;

    FUNCTION ReadCompetence(
        description VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE UpdateCompetence(
        description VARCHAR2,
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

    FUNCTION ReadRoomType(
        room_type VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE UpdateRoomType(
        room_type VARCHAR2
    );

    PROCEDURE DeleteRoomType(
        room_type VARCHAR2
    );

    -- CRUD for Room
    FUNCTION CreateRoom(
        designation VARCHAR2,
        room_type_id NUMBER
    ) RETURN NUMBER;

    FUNCTION ReadRoom(
        designation VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadRoom(
        room_number NUMBER
    ) RETURN NUMBER;

    PROCEDURE UpdateRoom(
        room_number NUMBER,
        room_type_id NUMBER
    );

    PROCEDURE DeleteRoom(
        room_number VARCHAR2
    );

    -- CRUD for ExamRole
    FUNCTION CreateExamRole(
        role_name VARCHAR2
    ) RETURN NUMBER;

    FUNCTION ReadExamRole(
        role_name VARCHAR2
    ) RETURN NUMBER;

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

    FUNCTION ReadExam(
        exam_id NUMBER
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
    ) RETURN NUMBER;

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
END exams_manager;
/

CREATE OR REPLACE PACKAGE BODY exams_manager AS
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
            CreateParticipant(test_id, examiner_id, NULL, NULL);
        END IF;

        -- If a class_id is provided, add the class as a participant
        IF class_id IS NOT NULL THEN
            AddParticipants(test_id, class_id, NULL, NULL);
        END IF;

        -- Return the test_id
        RETURN test_id;
    END CreateTest;

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
        test_id NUMBER,
        old_examiner_id NUMBER
    ) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        -- Your logic for finding a replacement examiner goes here
        -- You can use a cursor to return the result
        OPEN cur FOR
            -- Your SQL query here;
            RETURN cur;
    END FindReplacementExaminer;

    FUNCTION FindAvailableRoom(
        room_type VARCHAR2,
        test_date TIMESTAMP
    ) RETURN NUMBER AS
        room_id NUMBER;
    BEGIN
        -- Your logic for finding an available room goes here
        -- Assign the room_id to the available room
        -- You can implement your logic to check room availability and select a room based on room_type and test_date
        -- If a room is available, assign its ID to room_id, otherwise, assign NULL
        -- Example: SELECT id INTO room_id FROM Room WHERE designation = 'Available Room';

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
        WHERE exam_id = test_id AND person_id = person_id;
    END GradeStudent;

    FUNCTION CalculateGradeAverage(
        class_id NUMBER
    ) RETURN NUMBER AS
        avg_score NUMBER;
    BEGIN
        -- Calculate the grade average for a class and return it
        -- Your logic for calculating the average goes here
        -- Example: SELECT AVG(score) INTO avg_score FROM Participant WHERE exam_id IN (SELECT id FROM Exam WHERE subject_id = class_id);

        RETURN avg_score;
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
    ) RETURN NUMBER AS
        subject_id NUMBER;
    BEGIN
        -- Retrieve the subject_id based on the subject name
        SELECT id INTO subject_id
        FROM Subject
        WHERE name = name;

        RETURN subject_id;
    END ReadSubject;

    PROCEDURE UpdateSubject(
        name VARCHAR2
    ) AS
    BEGIN
        -- Update the subject record based on the subject name
        UPDATE Subject
        SET name = name
        WHERE id = ReadSubject(name);
    END UpdateSubject;

    PROCEDURE DeleteSubject(
        name VARCHAR2
    ) AS
    BEGIN
        -- Delete the subject record based on the subject name
        DELETE FROM Subject
        WHERE id = ReadSubject(name);
    END DeleteSubject;

    -- CRUD operations for Class
    FUNCTION CreateClass(
        name VARCHAR2,
        subject_id NUMBER
    ) RETURN NUMBER AS
        class_id NUMBER;
    BEGIN
        -- Insert a new class record into the Class table
        INSERT INTO Class (name, subject_id)
        VALUES (name, subject_id)
        RETURNING id INTO class_id;

        RETURN class_id;
    END CreateClass;

    FUNCTION ReadClass(
        name VARCHAR2
    ) RETURN NUMBER AS
        class_id NUMBER;
    BEGIN
        -- Retrieve the class_id based on the class name
        SELECT id INTO class_id
        FROM Class
        WHERE name = name;

        RETURN class_id;
    END ReadClass;

    PROCEDURE UpdateClass(
        name VARCHAR2,
        subject_id NUMBER
    ) AS
    BEGIN
        -- Update the class record based on the class name
        UPDATE Class
        SET name = name, subject_id = subject_id
        WHERE id = ReadClass(name);
    END UpdateClass;

    PROCEDURE DeleteClass(
        name VARCHAR2
    ) AS
    BEGIN
        -- Delete the class record based on the class name
        DELETE FROM Class
        WHERE id = ReadClass(name);
    END DeleteClass;

    -- CRUD operations for Person
    FUNCTION CreatePerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    ) RETURN NUMBER AS
        person_id NUMBER;
    BEGIN
        -- Insert a new person record into the Person table
        INSERT INTO Person (firstname, lastname)
        VALUES (firstName, lastName)
        RETURNING id INTO person_id;

        RETURN person_id;
    END CreatePerson;

    FUNCTION ReadPerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    ) RETURN NUMBER AS
        person_id NUMBER;
    BEGIN
        -- Retrieve the person_id based on the first name and last name
        SELECT id INTO person_id
        FROM Person
        WHERE firstname = firstName AND lastname = lastName;

        RETURN person_id;
    END ReadPerson;

    PROCEDURE UpdatePerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    ) AS
    BEGIN
        -- Update the person record based on the first name and last name
        UPDATE Person
        SET firstname = firstName, lastname = lastName
        WHERE id = ReadPerson(firstName, lastName);
    END UpdatePerson;

    PROCEDURE DeletePerson(
        firstName VARCHAR2,
        lastName VARCHAR2
    ) AS
    BEGIN
        -- Delete the person record based on the first name and last name
        DELETE FROM Person
        WHERE id = ReadPerson(firstName, lastName);
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

    FUNCTION ReadCompetence(
        description VARCHAR2
    ) RETURN NUMBER AS
        competence_id NUMBER;
    BEGIN
        -- Retrieve the competence_id based on the description
        SELECT id INTO competence_id
        FROM Competence
        WHERE description = description;

        RETURN competence_id;
    END ReadCompetence;

    PROCEDURE UpdateCompetence(
        description VARCHAR2,
        person_id NUMBER,
        subject_id NUMBER
    ) AS
    BEGIN
        -- Update the competence record based on the description, person_id, and subject_id
        UPDATE Competence
        SET person_id = person_id, subject_id = subject_id
        WHERE id = ReadCompetence(description);
    END UpdateCompetence;

    PROCEDURE DeleteCompetence(
        description VARCHAR2
    ) AS
    BEGIN
        -- Delete the competence record based on the description
        DELETE FROM Competence
        WHERE id = ReadCompetence(description);
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

    FUNCTION ReadRoomType(
        room_type VARCHAR2
    ) RETURN NUMBER AS
        room_type_id NUMBER;
    BEGIN
        -- Retrieve the room_type_id based on the room type
        SELECT id INTO room_type_id
        FROM RoomType
        WHERE room_type = room_type;

        RETURN room_type_id;
    END ReadRoomType;

    PROCEDURE UpdateRoomType(
        room_type VARCHAR2
    ) AS
    BEGIN
        -- Update the room type record based on the room type
        UPDATE RoomType
        SET room_type = room_type
        WHERE id = ReadRoomType(room_type);
    END UpdateRoomType;

    PROCEDURE DeleteRoomType(
        room_type VARCHAR2
    ) AS
    BEGIN
        -- Delete the room type record based on the room type
        DELETE FROM RoomType
        WHERE id = ReadRoomType(room_type);
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

    FUNCTION ReadRoom(
        designation VARCHAR2
    ) RETURN NUMBER AS
        room_id NUMBER;
    BEGIN
        -- Retrieve the room_id based on the designation
        SELECT id INTO room_id
        FROM Room
        WHERE designation = designation;

        RETURN room_id;
    END ReadRoom;

    FUNCTION ReadRoom(
        room_number NUMBER
    ) RETURN NUMBER AS
        room_id NUMBER;
    BEGIN
        -- Retrieve the room_id based on the room number
        SELECT id INTO room_id
        FROM Room
        WHERE id = room_number;

        RETURN room_id;
    END ReadRoom;

    PROCEDURE UpdateRoom(
        room_number NUMBER,
        room_type_id NUMBER
    ) AS
    BEGIN
        -- Update the room record based on the room number
        UPDATE Room
        SET type_id = room_type_id
        WHERE id = room_number;
    END UpdateRoom;

    PROCEDURE DeleteRoom(
        room_number VARCHAR2
    ) AS
    BEGIN
        -- Delete the room record based on the room number
        DELETE FROM Room
        WHERE id = room_number;
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
    ) RETURN NUMBER AS
        role_id NUMBER;
    BEGIN
        -- Retrieve the role_id based on the role name
        SELECT id INTO role_id
        FROM ExamRole
        WHERE role = role_name;

        RETURN role_id;
    END ReadExamRole;

    PROCEDURE UpdateExamRole(
        old_role_name VARCHAR2,
        new_role_name VARCHAR2
    ) AS
    BEGIN
        -- Update the exam role record based on the old and new role names
        UPDATE ExamRole
        SET role = new_role_name
        WHERE id = ReadExamRole(old_role_name);
    END UpdateExamRole;

    PROCEDURE DeleteExamRole(
        role_name VARCHAR2
    ) AS
    BEGIN
        -- Delete the exam role record based on the role name
        DELETE FROM ExamRole
        WHERE id = ReadExamRole(role_name);
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

    FUNCTION ReadExam(
        exam_id NUMBER
    ) RETURN NUMBER AS
        exam_id NUMBER;
    BEGIN
        -- Verify if an exam with the specified ID exists
        SELECT id INTO exam_id
        FROM Exam
        WHERE id = exam_id;

        RETURN exam_id;
    END ReadExam;

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
        SET title = title, exam_date = exam_date, subject_id = subject_id, room_id = room_id
        WHERE id = exam_id;
    END UpdateExam;

    PROCEDURE DeleteExam(
        exam_id NUMBER
    ) AS
    BEGIN
        -- Delete the exam record based on the exam ID
        DELETE FROM Exam
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
    ) RETURN NUMBER AS
        participant_id NUMBER;
    BEGIN
        -- Verify if a participant with the specified IDs exists
        SELECT id INTO participant_id
        FROM Participant
        WHERE exam_id = exam_id AND person_id = person_id AND exam_role_id = exam_role_id;

        RETURN participant_id;
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
        WHERE id = ReadParticipant(exam_id, person_id, exam_role_id);
    END UpdateParticipant;

    PROCEDURE DeleteParticipant(
        exam_id NUMBER,
        person_id NUMBER,
        exam_role_id NUMBER
    ) AS
    BEGIN
        -- Delete the participant record based on the exam ID, person ID, and exam role ID
        DELETE FROM Participant
        WHERE id = ReadParticipant(exam_id, person_id, exam_role_id);
    END DeleteParticipant;
END exams_manager;
/
