SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS null;
SELECT * FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT * FROM persona WHERE tipo IN ('profesor') AND telefono IS NULL AND nif REGEXP 'K$';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7 AND curso = 3;
SELECT apellido1, apellido2, per.nombre, d.nombre AS departamento FROM persona per JOIN profesor pro ON per.id = pro.id_profesor JOIN departamento d ON pro.id_departamento = d.id ORDER BY per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura asma JOIN persona per ON per.id = asma.id_alumno JOIN asignatura a ON asma.id_asignatura = a.id JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE per.nif IN ('26902806M');
SELECT d.nombre FROM asignatura a JOIN grado g ON a.id_grado = (SELECT g.id FROM grado g WHERE nombre IN ('Grado en Ingeniería Informática (Plan 2015)')) JOIN profesor p ON a.id_profesor = p.id_profesor JOIN departamento d ON p.id_departamento = d.id GROUP BY d.nombre;
SELECT per.id, per.nif, per.nombre, per.apellido1, per.apellido2 FROM persona per JOIN alumno_se_matricula_asignatura asma ON per.id = asma.id_alumno JOIN asignatura a ON asma.id_asignatura = a.id JOIN curso_escolar ce ON asma.id_curso_escolar = (SELECT ce.id FROM curso_escolar ce WHERE anyo_inicio IN (2018)) GROUP BY per.id;
SELECT d.nombre AS departamento, per.apellido1, per.apellido2, per.nombre FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id ORDER BY d.nombre ASC, per.apellido1 ASC;
SELECT per.apellido1, per.apellido2, per.nombre FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id WHERE d.nombre IS NULL ORDER BY per.apellido1 ASC;
SELECT d.id, d.nombre AS departamento FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor RIGHT JOIN departamento d ON prof.id_departamento = d.id WHERE per.nombre IS NULL ORDER BY d.id;
SELECT per.id, per.apellido1, per.apellido2, per.nombre FROM persona per RIGHT JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN asignatura a ON per.id = a.id_profesor WHERE a.id_profesor IS NULL ORDER BY per.id;
SELECT * FROM asignatura WHERE id_profesor IS NULL;
SELECT DISTINCT d.id, d.nombre, ce.id FROM departamento d  LEFT JOIN profesor prof ON d.id = prof.id_departamento LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor LEFT JOIN curso_escolar ce ON a.curso = ce.id WHERE ce.id IS NULL;
SELECT COUNT(nombre) AS total_alumnos FROM persona WHERE tipo IN ('alumno');
SELECT COUNT(fecha_nacimiento) AS alumnos_nacidos_1999 FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'; 
SELECT d.nombre, Count(prof.id_departamento) AS profesores FROM persona per JOIN profesor prof ON per.id = prof.id_profesor JOIN departamento d ON prof.id_departamento = d.id GROUP BY d.id ORDER BY profesores DESC;
SELECT d.nombre, Count(prof.id_departamento) AS profesores FROM persona per JOIN profesor prof ON per.id = prof.id_profesor RIGHT JOIN departamento d ON prof.id_departamento = d.id GROUP BY d.id ORDER BY profesores DESC;
SELECT g.nombre, COUNT(a.id_grado) AS asignaturas FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id ORDER BY asignaturas DESC;
SELECT g.nombre, COUNT(a.id_grado) AS asignaturas FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id  GROUP BY g.id HAVING asignaturas > 40;
SELECT g.nombre, COUNT(a.creditos) AS creditos_totales, a.tipo FROM grado g JOIN asignatura a ON g.id= a.id_grado GROUP BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, COUNT(per.id) AS alumnos FROM persona per JOIN  alumno_se_matricula_asignatura asma ON per.id = asma.id_alumno JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id GROUP BY ce.anyo_inicio;  
SELECT per.id, per.nombre, per.apellido1, per.apellido2, Count(a.id_profesor) AS asignaturas FROM profesor prof JOIN persona per ON prof.id_profesor = per.id LEFT JOIN asignatura a ON a.id_profesor = prof.id_profesor GROUP BY per.nombre ORDER BY asignaturas DESC;
SELECT * FROM persona WHERE fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona) AND tipo IN ('alumno');
SELECT per.id, per.nombre, per.apellido1, per.apellido2 FROM profesor prof JOIN persona per ON per.id = prof.id_profesorLEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL ORDER BY per.id;










