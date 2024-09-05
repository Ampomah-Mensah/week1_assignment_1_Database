create Database hospital_db;
use hospital_db;


create table patient(
patient_id int primary key auto_increment,
first_name varchar(14),
last_name varchar(14),
date_of_birth Date,
gender varchar(1),
Language varchar(15)
);

create table providers(
provider_id int primary key auto_increment,
first_name varchar(14) Not null,
last_name varchar(14) Not null,
provider_speciality varchar(30) Not null,
email_address  varchar(30),
phone_number varchar(30),
date_joined Date Not null
);

create table visits(
visit_id int primary key auto_increment,
patient_id int,
provider_id int,
date_of_visit Date Not null,
date_scheduled Date Not null,
visit_department_id int Not null,
visit_type Varchar(255) Not null,
blood_pressure_systollic int,
blood_pressure_diastollic Decimal,
pulse Decimal,
visit_status Varchar(255) Not null,
foreign key(patient_id) references patient(patient_id),
foreign key(provider_id) references providers(provider_id)
);

create table ed_visits(
ed_visit_id int primary key auto_increment,
visit_id int,
patient_id int,
acuity int Not Null,
reason_for_visit varchar(255) Not Null,
disposition varchar(255) Not Null,
foreign key(visit_id) references visits(visit_id),
foreign key(patient_id) references patient(patient_id)
);


create table admissions(
admission_id int primary key auto_increment,
patient_id int,
admission_date Date Not Null,
discharge_date Date Not Null,
discharge_disposition varchar(255) Not Null,
service varchar(255) Not Null,
primary_diagnosis varchar(255) Not Null,
foreign key(patient_id) references patient(patient_id)
);

create table discharges(
discharge_id int Primary key auto_increment,
admission_id int,
patient_id int,
discharge_date Date Not Null,
discharged_disposition varchar(255) Not Null,
foreign key(admission_id) references admissions(admission_id),
foreign key(patient_id) references patient(patient_id)
);

