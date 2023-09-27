DROP TABLE Participant;
DROP TABLE Test;
DROP TABLE TestRole;
DROP TABLE Room;
DROP TABLE RoomType;
DROP TABLE Competence;
DROP TABLE Person;
DROP TABLE Class;
DROP TABLE Subject;

CREATE TABLE Subject
(
    id   NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_subject PRIMARY KEY (id),

    name VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE Class
(
    id   NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_class PRIMARY KEY (id),

    name VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE Person
(
    id        NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_person PRIMARY KEY (id),

    firstname VARCHAR2(100) NOT NULL,
    lastname  VARCHAR2(100) NOT NULL,

    class_id  NUMBER,
    CONSTRAINT fk_person_class FOREIGN KEY (class_id) REFERENCES Class (id)
);

CREATE TABLE Competence
(
    id          NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_competence PRIMARY KEY (id),

    description VARCHAR2(100) NOT NULL UNIQUE,

    person_id   NUMBER,
    CONSTRAINT fk_competence_person
        FOREIGN KEY (person_id) REFERENCES Person (id),

    subject_id  NUMBER,
    CONSTRAINT fk_competence_subject
        FOREIGN KEY (subject_id) REFERENCES Subject (id)
);

CREATE TABLE RoomType
(
    id   NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_room_type PRIMARY KEY (id),

    type VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE Room
(
    id          NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_room PRIMARY KEY (id),

    designation VARCHAR2(100) NOT NULL UNIQUE,

    type_id     NUMBER NOT NULL,
    CONSTRAINT fk_room_room_type FOREIGN KEY (type_id) REFERENCES RoomType (id)
);

CREATE TABLE TestRole
(
    id   NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_test_role PRIMARY KEY (id),

    role VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE Test
(
    id         NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CONSTRAINT pk_test PRIMARY KEY (id),

    title      VARCHAR2(100) NOT NULL,
    test_date  TIMESTAMP NOT NULL,

    subject_id NUMBER    NOT NULL,
    CONSTRAINT fk_test_subject FOREIGN KEY (subject_id) REFERENCES Subject (id),

    room_id    NUMBER,
    CONSTRAINT fk_test_room FOREIGN KEY (room_id) REFERENCES Room (id)
);

CREATE TABLE Participant
(
    test_id      NUMBER,
    CONSTRAINT fk_participant_test FOREIGN KEY (test_id) REFERENCES Test (id),

    person_id    NUMBER,
    CONSTRAINT fk_participant_person FOREIGN KEY (person_id) REFERENCES Person (id),

    test_role_id NUMBER,
    CONSTRAINT fk_participant_test_role FOREIGN KEY (test_role_id) REFERENCES TestRole (id),

    CONSTRAINT pk_participant PRIMARY KEY (test_id, person_id, test_role_id),

    score        NUMBER
);
CREATE TABLE LogTable
(
    log_id            NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    event_type        VARCHAR2(20) NOT NULL,
    event_description VARCHAR2(255) NOT NULL,
    event_timestamp   TIMESTAMP DEFAULT SYSTIMESTAMP,
    Constraint        pk_logTable PRIMARY KEY (log_id)
);
