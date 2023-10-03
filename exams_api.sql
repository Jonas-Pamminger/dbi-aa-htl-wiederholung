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