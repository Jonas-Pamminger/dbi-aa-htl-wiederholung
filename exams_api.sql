CREATE OR REPLACE PACKAGE exams_manager AS
  -- Test-Eintrag: Einen Test mit einer Klasse anlegen
  PROCEDURE CreateTest(
    title VARCHAR2,
    test_date TIMESTAMP,
    examiner_id NUMBER DEFAULT NULL,
    subject_id NUMBER,
    class_id NUMBER DEFAULT NULL
  );

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
END exams_manager;
/