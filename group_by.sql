1. Contare quanti iscritti ci sono stati ogni anno

SELECT 
YEAR(`enrolment_date`),
COUNT(YEAR(`enrolment_date`)) 
FROM `students` 
GROUP BY (`enrolment_date`);

2. Contare gli insegnanti che hanno l ufficio nello stesso edificio

SELECT COUNT(id), `office_address` 
FROM `teachers` 
GROUP BY `office_address`; 

3. Calcolare la media dei voti di ogni appello d esame

SELECT AVG(vote), exam_id
FROM `exam_student`
GROUP BY exam_id;

4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(id) as totale_corsi, GROUP_CONCAT(id) as id_corsi
FROM degrees
GROUP BY department_id;