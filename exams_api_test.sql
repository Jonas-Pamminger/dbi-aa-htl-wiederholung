-- Create a function to find a replacement examiner for a given exam

DECLARE
    exam_id_to_find NUMBER := 1; -- Replace with the desired exam_id
    replacement_examiner PERSON%rowtype;
BEGIN
    replacement_examiner := EXAMS_MANAGER.FindReplacementExaminer(exam_id_to_find);

    DBMS_OUTPUT.PUT_LINE('Exam ID: ' || exam_id_to_find);
    DBMS_OUTPUT.PUT_LINE('Replacement Examiner ID: ' || replacement_examiner.id);
    DBMS_OUTPUT.PUT_LINE('Replacement Examiner Name: ' || replacement_examiner.FIRSTNAME);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for exam_id ' || exam_id_to_find);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

-- Create a function to find an available room for a given room type and exam date
DECLARE
    room_type_id_to_find RoomType.id%TYPE := 2; -- Replace with the desired room_type_id
    exam_date_to_find Exam.exam_date%TYPE := TO_DATE('2023-10-15', 'YYYY-MM-DD'); -- Replace with the desired exam_date
    available_room_id Room.id%TYPE;
BEGIN
    -- Call the FindAvailableRoom function
    available_room_id := EXAMS_MANAGER.FindAvailableRoom(room_type_id_to_find, exam_date_to_find);

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Room Type ID: ' || room_type_id_to_find);
    DBMS_OUTPUT.PUT_LINE('Exam Date: ' || TO_CHAR(exam_date_to_find, 'YYYY-MM-DD'));

    IF available_room_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Available Room ID: ' || available_room_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No available room found for the given criteria.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the given criteria.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

DECLARE
    student_id_to_find Person.id%TYPE := 17; -- Replace with the desired student_id
    average_grade NUMBER;
BEGIN
    -- Call the CalculateGradeAverage function
    average_grade := EXAMS_MANAGER.CalculateGradeAverage(student_id_to_find);

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Student ID: ' || student_id_to_find);

    IF average_grade IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Average Grade: ' || average_grade);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No average grade found for the given student.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the given student ID ' || student_id_to_find);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

DECLARE
    class_name_to_find Class.name%TYPE := '5AHIF'; -- Replace with the desired class_name
    subject_name_to_find Subject.name%TYPE := 'Mathematik'; -- Replace with the desired subject_name
    testResult TestResultType; -- Assuming TestResultType is a user-defined type

    CURSOR result_cursor IS
    SELECT TestResultType(P2.FIRSTNAME, P2.LASTNAME, AVG(p.score)) AS result
        FROM Participant p
                 JOIN PERSON P2 ON p.PERSON_ID = P2.ID
                 JOIN CLASS C2 ON P2.CLASS_ID = C2.ID
                 JOIN Exam T ON T.ID = p.exam_id
                 JOIN SUBJECT S2 ON T.SUBJECT_ID = S2.ID
        WHERE C2.NAME = class_name_to_find
          AND S2.NAME = subject_name_to_find
        GROUP BY P2.FIRSTNAME, P2.LASTNAME;
BEGIN
    -- Open the cursor and fetch the result

    DBMS_OUTPUT.PUT_LINE('Class Name: ' || class_name_to_find);
    DBMS_OUTPUT.PUT_LINE('Subject Name: ' || subject_name_to_find);

    OPEN result_cursor;
    LOOP
    FETCH result_cursor INTO testResult;

    EXIT WHEN result_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('-------------------------');
        DBMS_OUTPUT.PUT_LINE('First Name: ' || testResult.firstname);
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || testResult.lastname);
        DBMS_OUTPUT.PUT_LINE('Average Score: ' || ROUND(testResult.score,2));


    END LOOP;
    CLOSE result_cursor;

    -- Display the result




EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


