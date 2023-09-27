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
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into Subject', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in Subject was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in Subject was deleted', SYSTIMESTAMP);
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
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into Class', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in Class was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in Class was deleted', SYSTIMESTAMP);
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
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into Person', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in Person was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in Person was deleted', SYSTIMESTAMP);
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
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into Competence', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in Competence was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in Competence was deleted', SYSTIMESTAMP);
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
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into RoomType', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in RoomType was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in RoomType was deleted', SYSTIMESTAMP);
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
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into Room', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in Room was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in Room was deleted', SYSTIMESTAMP);
END IF;
END;
/

-- Trigger for the TestRole table
CREATE
OR REPLACE TRIGGER trg_testrole_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON TestRole
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into TestRole', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in TestRole was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in TestRole was deleted', SYSTIMESTAMP);
END IF;
END;
/

-- Trigger for the Test table
CREATE
OR REPLACE TRIGGER trg_test_logging
       AFTER INSERT OR
UPDATE OR
DELETE
ON Test
    FOR EACH ROW
BEGIN
    IF
INSERTING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into Test', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in Test was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in Test was deleted', SYSTIMESTAMP);
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
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('INSERT', 'A record was inserted into Participant', SYSTIMESTAMP);
    ELSIF
UPDATING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('UPDATE', 'A record in Participant was updated', SYSTIMESTAMP);
    ELSIF
DELETING THEN
        INSERT INTO LogTable (event_type, event_description, event_timestamp)
        VALUES ('DELETE', 'A record in Participant was deleted', SYSTIMESTAMP);
END IF;
END;
/

