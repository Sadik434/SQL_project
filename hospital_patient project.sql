CREATE TABLE patients(
	p_id serial primary key,
	p_name varchar(50) not null,
	p_age int not null,
	p_gender varchar(2) not null,
	p_phone int not null,
	p_address varchar(50) not null
);
ALTER TABLE patients alter column p_phone Type varchar(50);
SELECT * FROM patients;
INSERT INTO patients(p_name, p_age, p_gender, p_phone, p_address)
VALUES
    ('sadik',   21, 'M', '6206639856',  'delhi'),
    ('rehan',   22, 'M', '6206775856',  'mumbai'),
    ('farhan',  20, 'M', '6206639000',  'haryana'),
    ('sufiyan', 22, 'M', '6206637776',  'noida'),
    ('danyal',  22, 'M', '6206639869',  'kolkata'),
    ('danish',  23, 'M', '6206639089',  'dehradun'),
    ('zakir',   25, 'M', '6206639890', 'bhopal'),
    ('deepak',  26, 'M', '6289639856',  'jaipur'),
    ('shruti',  22, 'F', '6878663986', 'patna');
CREATE TABLE doctors(
	d_name
CREATE TABLE doctors(
	d_id int,foreign key(d_id) references patients(p_id),
	d_name varchar(50) not null
);
SELECT * FROM doctors;	
INSERT INTO doctors(d_id,d_name)
values(1,'Dr. Anil Sharma'),
	  (2,'Dr. Priya Mehta'),
	  (3,'Dr. Rakesh Kumar'),
	  (4,'Dr. Sneha Verma'),
	  (5,'Dr. Sanjay Gupta'),
	  (6,'Dr. Salman khan'),
	  (7,'Dr. Rajesh Singh'),
	  (8,'Dr. Meera Nair'),
	  (9,'Dr. Kavita Rao');

CREATE TABLE appointments(
	appointment_id int,foreign key(appointment_id) references patients(p_id),
	staff_id INT NOT NULL,
    service_id INT,
    appointment_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME
);
SELECT * FROM appointments;
INSERT INTO appointments 
(appointment_id, staff_id, service_id, appointment_date, start_time, end_time) 
VALUES
(1, 1, 1, '2025-08-13', '10:00:00', '10:30:00'),
(2, 2, 2, '2025-08-13', '11:00:00', '11:45:00'),
(3, 3, 3, '2025-08-14', '09:30:00', '10:15:00'),
(4, 4, 4, '2025-08-14', '14:00:00', '14:30:00'),
(5, 5, 5, '2025-08-15', '15:00:00', '15:45:00'),
(6, 6, 6, '2025-08-15', '16:00:00', '16:30:00'),
(7, 7, 7, '2025-08-16', '09:00:00', '09:45:00'),
(8, 8, 8, '2025-08-16', '10:15:00', '10:45:00'),
(9, 9, 9, '2025-08-17', '11:30:00', '12:00:00');

select * from patients
inner join doctors
on patients.p_id = doctors.d_id
inner join appointments
on patients.p_id = appointments.appointment_id;

SELECT d.d_name, COUNT(a.appointment_id) AS total_appointment
FROM appointments a
JOIN doctors d 
ON a.appointment_id = d.d_id
WHERE EXTRACT(YEAR FROM a.appointment_date) = EXTRACT(YEAR FROM CURRENT_DATE)
AND EXTRACT(WEEK FROM a.appointment_date) = EXTRACT(WEEK FROM CURRENT_DATE)
GROUP BY d.d_id, d.d_name
ORDER BY total_appointment DESC
LIMIT 1;














