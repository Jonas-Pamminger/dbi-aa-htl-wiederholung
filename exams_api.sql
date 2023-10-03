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
        name Subject.name%TYPE) RETURN Subject.id%TYPE;

    FUNCTION ReadSubject(
        name Subject.name%TYPE) RETURN Subject.id%TYPE;

    PROCEDURE UpdateSubject(
        name Subject.name%TYPE);

    PROCEDURE DeleteSubject(
        name Subject.name%TYPE);

    -- CRUD for Class
    FUNCTION CreateClass(
        name Class.name%TYPE,
        subject_id Class.subject_id%TYPE) RETURN NUMBER;

    FUNCTION ReadClass(
        name Class.name%TYPE) RETURN Number;

    PROCEDURE UpdateClass(
        name Class.name%TYPE,
        subject_id Class.subject_id%TYPE);

    PROCEDURE DeleteClass(
        name Class.name%TYPE);

    -- CRUD for Person
    FUNCTION CreatePerson(
        name Person.name%TYPE,
        firstName Person.firstname%TYPE,
        lastName Person.lastname%TYPE
    ) RETURN Person.id%TYPE;

    FUNCTION ReadPerson(
        firstName Person.firstname%TYPE,
        lastName Person.lastname%TYPE
    ) RETURN Person.id%TYPE;

    PROCEDURE UpdatePerson(
        name Person.name%TYPE,
        firstName Person.firstname%TYPE,
        lastName Person.lastname%TYPE
    );

    PROCEDURE DeletePerson(
        name Person.name%TYPE
    );

    -- CRUD for Competence
    FUNCTION CreateCompetence(
        description Competence.description%TYPE
    ) RETURN Competence.id%TYPE;

    FUNCTION CreateCompetence(
        description Competence.description%TYPE,
        person_id Competence.person_id%TYPE
    ) RETURN Competence.id%TYPE;

    FUNCTION CreateCompetence(
        description Competence.description%TYPE,
        person_id Competence.person_id%TYPE,
        subject_id Competence.subject_id%TYPE
    ) RETURN Competence.id%TYPE;

    FUNCTION ReadCompetence(
        description Competence.description%TYPE
    ) RETURN Competence.id%TYPE;

    PROCEDURE UpdateCompetence(
        description Competence.description%TYPE,
        person_id Competence.person_id%TYPE,
        subject_id Competence.subject_id%TYPE
    );

    PROCEDURE DeleteCompetence(
        description Competence.description%TYPE
    );

    -- CRUD for RoomType
    FUNCTION CreateRoomType(
        room_type RoomType.room_type%TYPE
    ) RETURN RoomType.id%TYPE;

    FUNCTION ReadRoomType(
        room_type RoomType.room_type%TYPE
    ) RETURN RoomType.id%TYPE;

    PROCEDURE UpdateRoomType(
        room_type RoomType.room_type%TYPE
    );

    PROCEDURE DeleteRoomType(
        room_type RoomType.room_type%TYPE
    );

    -- CRUD for Room
    FUNCTION CreateRoom(
        designation Room.designation%TYPE,
        room_type_id Room.type_id%TYPE
    ) RETURN Room.id%TYPE;

    FUNCTION ReadRoom(
        designation Room.designation%TYPE
    ) RETURN Room.id%TYPE;

    FUNCTION ReadRoom(
        room_number Room.id%TYPE
    ) RETURN Room.id%TYPE;

    PROCEDURE UpdateRoom(
        room_number Room.room_number%TYPE,
        room_type_id Room.room_type_id%TYPE
    );

    PROCEDURE DeleteRoom(
        room_number Room.designation%TYPE
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