-- Trigger for the Subject table
CREATE
OR REPLACE TRIGGER trg_subject_logging
AFTER INSERT OR
UPDATE OR
DELETE
ON Subject
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into Subject', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in Subject was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in Subject was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/
-- Trigger for the Class table
CREATE
OR REPLACE TRIGGER trg_class_logging
AFTER INSERT OR
UPDATE OR
DELETE
ON Class
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into Class', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in Class was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in Class was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/
-- Trigger for the Person table
CREATE
OR REPLACE TRIGGER trg_person_logging
AFTER INSERT OR
UPDATE OR
DELETE
ON Person
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into Person', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in Person was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in Person was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/

-- Trigger for the Competence table
CREATE
OR REPLACE TRIGGER trg_competence_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON Competence
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into Competence', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in Competence was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in Competence was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/
-- Trigger for the RoomType table
CREATE
OR REPLACE TRIGGER trg_roomtype_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON RoomType
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into RoomType', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in RoomType was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in RoomType was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/

-- Trigger for the Room table
CREATE
OR REPLACE TRIGGER trg_room_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON Room
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into Room', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in Room was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in Room was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/

-- Trigger for the TestRole table
CREATE
OR REPLACE TRIGGER trg_testrole_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON EXAMROLE
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into TestRole', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in TestRole was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in TestRole was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/

-- Trigger for the Test table
CREATE
OR REPLACE TRIGGER trg_test_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON Exam
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into Test', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in Test was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in Test was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/

-- Trigger for the Participant table
CREATE
OR REPLACE TRIGGER trg_participant_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON Participant
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('INSERT', 'A record was inserted into Participant', SYSTIMESTAMP, USER);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('UPDATE', 'A record in Participant was updated', SYSTIMESTAMP, USER);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp, db_user)
        VALUES ('DELETE', 'A record in Participant was deleted', SYSTIMESTAMP, USER);
END IF;
END;
/


