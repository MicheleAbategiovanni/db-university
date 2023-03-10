1. Selezionare tutti gli studenti iscritti al Corso di Laurea IN Economia
SELECT  *
FROM `degrees`
INNER JOIN `students`
ON `students`.`degree_id` = `degrees`.`department_id`
WHERE `department_id` = "9";

SELECT  *
FROM `degrees`
INNER JOIN `students`
ON `students`.`degree_id` = `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia"; 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT  *
FROM `degrees`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`department_id` = 7
AND `degrees`.`level` = "magistrale"; 3. Selezionare tutti i corsi IN cui insegna Fulvio Amato (id = 44)

SELECT  *
FROM `course_teacher`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teacher_id` = "44"; 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, IN ordine alfabetico per cognome e nome

SELECT  *
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`name`, `students`.`surname` ASC;
-- OPPURE PIU' FASHION
SELECT  `students`.`id`
       ,`students`.`name`
       ,`students`.`surname`
       ,`degrees`.`name`     AS nome_corso
       ,`departments`.`name` AS nome_dipartimento
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`name`, `students`.`surname` ASC; 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT  teachers.name
       ,teachers.surname
       ,course_teacher.course_id
       ,courses.degree_id
       ,courses.name        AS name_courses
       ,courses.description AS description_courses
       ,degrees.id          AS degrees_id
       ,degrees.department_id
FROM `teachers`
INNER JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`; 

6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) 

SELECT  DISTINCT	teachers.name, 
		       teachers.surname, 
                     departments.name as name_departments
FROM `teachers`
INNER JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`id` = 5;

7. BONUS: Selezionare per ogni studente quanti tentativi d???esame ha sostenuto per superare ciascuno dei suoi esami